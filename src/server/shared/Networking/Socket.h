/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __SOCKET_H__
#define __SOCKET_H__

#include "MessageBuffer.h"
#include "Log.h"
#include <atomic>
#include <queue>
#include <memory>
#include <functional>
#include <type_traits>
#include <boost/asio/ip/tcp.hpp>
#include <boost/asio/co_spawn.hpp>
#include <boost/asio/awaitable.hpp>
#include <boost/asio/use_awaitable.hpp>
#include <boost/asio/redirect_error.hpp>
#include <boost/asio/detached.hpp>

using boost::asio::ip::tcp;

#define READ_BLOCK_SIZE 4096
#ifdef BOOST_ASIO_HAS_IOCP
#define TC_SOCKET_USE_IOCP
#endif

template<class T>
class Socket : public std::enable_shared_from_this<T>
{
public:
    explicit Socket(tcp::socket&& socket) : _socket(std::move(socket)), _remoteAddress(_socket.remote_endpoint().address()),
        _remotePort(_socket.remote_endpoint().port()), _readBuffer(), _closed(false), _closing(false), _isWritingAsync(false), _isReadSuspended(false)
    {
        _readBuffer.Resize(READ_BLOCK_SIZE);
    }

    virtual ~Socket()
    {
        _closed = true;
        boost::system::error_code error;
        _socket.close(error);
    }

    virtual void Start() = 0;

    virtual bool Update()
    {
        if (_closed)
            return false;

#ifndef TC_SOCKET_USE_IOCP
        if (_isWritingAsync || (_writeQueue.empty() && !_closing))
            return true;

        for (; HandleQueue();)
            ;
#endif

        return true;
    }

    boost::asio::ip::address GetRemoteIpAddress() const
    {
        return _remoteAddress;
    }

    uint16 GetRemotePort() const
    {
        return _remotePort;
    }

    void AsyncRead()
    {
        if (!IsOpen())
            return;

        _isReadSuspended = false;

        boost::asio::co_spawn(_socket.get_executor(),
            [self = this->shared_from_this()]() -> boost::asio::awaitable<void> {
                co_await self->ReadProcess();
            }, boost::asio::detached);
    }

    void SuspendRead()
    {
        _isReadSuspended = true;
    }

    void QueuePacket(MessageBuffer&& buffer)
    {
        _writeQueue.push(std::move(buffer));

#ifdef TC_SOCKET_USE_IOCP
        AsyncProcessQueue();
#endif
    }

    bool IsOpen() const { return !_closed && !_closing; }

    void CloseSocket()
    {
        if (_closed.exchange(true))
            return;

        boost::system::error_code shutdownError;
        _socket.shutdown(boost::asio::socket_base::shutdown_send, shutdownError);
        if (shutdownError)
            TC_LOG_DEBUG("network", "Socket::CloseSocket: {} errored when shutting down socket: {} ({})", GetRemoteIpAddress().to_string(),
                shutdownError.value(), shutdownError.message());

        OnClose();
    }

    /// Marks the socket for closing after write buffer becomes empty
    void DelayedCloseSocket()
    {
        if (_closing.exchange(true))
            return;

        if (_writeQueue.empty())
            CloseSocket();
    }

    MessageBuffer& GetReadBuffer() { return _readBuffer; }

    tcp::socket& underlying_stream()
    {
        return _socket;
    }

protected:
    virtual void OnClose() { }

    virtual void ReadHandler() = 0;

    bool AsyncProcessQueue()
    {
        if (_isWritingAsync)
            return false;

        _isWritingAsync = true;

#ifdef TC_SOCKET_USE_IOCP
        boost::asio::co_spawn(_socket.get_executor(),
            [self = this->shared_from_this()]() -> boost::asio::awaitable<void> {
                co_await self->WriteProcess();
            }, boost::asio::detached);
#else
        boost::asio::co_spawn(_socket.get_executor(),
            [self = this->shared_from_this()]() -> boost::asio::awaitable<void> {
                co_await self->WriteProcessWrapper();
            }, boost::asio::detached);
#endif

        return false;
    }

    void SetNoDelay(bool enable)
    {
        boost::system::error_code err;
        _socket.set_option(tcp::no_delay(enable), err);
        if (err)
            TC_LOG_DEBUG("network", "Socket::SetNoDelay: failed to set_option(boost::asio::ip::tcp::no_delay) for {} - {} ({})",
                GetRemoteIpAddress().to_string(), err.value(), err.message());
    }

private:
    boost::asio::awaitable<void> ReadProcess()
    {
        while (IsOpen() && !_isReadSuspended)
        {
            _readBuffer.Normalize();
            _readBuffer.EnsureFreeSpace();

            boost::system::error_code error;
            std::size_t transferredBytes = co_await _socket.async_read_some(
                boost::asio::buffer(_readBuffer.GetWritePointer(), _readBuffer.GetRemainingSpace()),
                boost::asio::redirect_error(boost::asio::use_awaitable, error));

            if (error)
            {
                if (error != boost::asio::error::eof && error != boost::asio::error::operation_aborted)
                    TC_LOG_DEBUG("network", "Socket::ReadProcess error: {} - {} ({})", GetRemoteIpAddress().to_string(), error.value(), error.message());
                CloseSocket();
                co_return;
            }

            _readBuffer.WriteCompleted(transferredBytes);
            ReadHandler();
        }
    }

#ifdef TC_SOCKET_USE_IOCP

    boost::asio::awaitable<void> WriteProcess()
    {
        while (IsOpen() && !_writeQueue.empty())
        {
            MessageBuffer& buffer = _writeQueue.front();
            boost::system::error_code error;
            std::size_t transferedBytes = co_await _socket.async_write_some(
                boost::asio::buffer(buffer.GetReadPointer(), buffer.GetActiveSize()),
                boost::asio::redirect_error(boost::asio::use_awaitable, error));

            if (!error)
            {
                _writeQueue.front().ReadCompleted(transferedBytes);
                if (!_writeQueue.front().GetActiveSize())
                    _writeQueue.pop();

                if (_closing && _writeQueue.empty())
                    CloseSocket();
            }
            else
            {
                CloseSocket();
                break;
            }
        }
        _isWritingAsync = false;
    }

#else

    boost::asio::awaitable<void> WriteProcessWrapper()
    {
        while (IsOpen() && !_writeQueue.empty())
        {
            boost::system::error_code error;
            co_await _socket.async_write_some(boost::asio::null_buffers(),
                boost::asio::redirect_error(boost::asio::use_awaitable, error));

            if (error)
            {
                if (error != boost::asio::error::would_block && error != boost::asio::error::try_again)
                {
                    _writeQueue.pop();
                    if (_closing && _writeQueue.empty())
                        CloseSocket();
                    CloseSocket();
                    break;
                }
            }

            if (!HandleQueue())
                break;
        }
        _isWritingAsync = false;
    }

    bool HandleQueue()
    {
        if (_writeQueue.empty())
            return false;

        MessageBuffer& queuedMessage = _writeQueue.front();

        std::size_t bytesToSend = queuedMessage.GetActiveSize();

        boost::system::error_code error;
        std::size_t bytesSent = _socket.write_some(boost::asio::buffer(queuedMessage.GetReadPointer(), bytesToSend), error);

        if (error)
        {
            if (error == boost::asio::error::would_block || error == boost::asio::error::try_again)
                return true;

            _writeQueue.pop();
            if (_closing && _writeQueue.empty())
                CloseSocket();
            return false;
        }
        else if (bytesSent == 0)
        {
            _writeQueue.pop();
            if (_closing && _writeQueue.empty())
                CloseSocket();
            return false;
        }
        else if (bytesSent < bytesToSend) // now n > 0
        {
            queuedMessage.ReadCompleted(bytesSent);
            return true;
        }

        _writeQueue.pop();
        if (_closing && _writeQueue.empty())
            CloseSocket();
        return !_writeQueue.empty();
    }

#endif

    tcp::socket _socket;

    boost::asio::ip::address _remoteAddress;
    uint16 _remotePort;

    MessageBuffer _readBuffer;
    std::queue<MessageBuffer> _writeQueue;

    std::atomic<bool> _closed;
    std::atomic<bool> _closing;

    bool _isWritingAsync;
    bool _isReadSuspended;
};

#endif // __SOCKET_H__
