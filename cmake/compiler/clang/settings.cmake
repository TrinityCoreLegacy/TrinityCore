set(CLANG_EXPECTED_VERSION 14.0.0)
if(CMAKE_CXX_COMPILER_ID MATCHES "AppleClang")
  # As of Xcode 14 / AppleClang 14, version numbers match upstream LLVM Clang
  set(CLANG_EXPECTED_VERSION 14.0.0)
  # enable -fpch-instantiate-templates for AppleClang (by default it is active only for regular clang)
  set(CMAKE_C_COMPILE_OPTIONS_INSTANTIATE_TEMPLATES_PCH -fpch-instantiate-templates)
  set(CMAKE_CXX_COMPILE_OPTIONS_INSTANTIATE_TEMPLATES_PCH -fpch-instantiate-templates)
endif()

if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS CLANG_EXPECTED_VERSION)
  message(FATAL_ERROR "Clang: TrinityCore requires version ${CLANG_EXPECTED_VERSION} to build but found ${CMAKE_CXX_COMPILER_VERSION}")
else()
  message(STATUS "Clang: Minimum version required is ${CLANG_EXPECTED_VERSION}, found ${CMAKE_CXX_COMPILER_VERSION} - ok!")
endif()

if(WITH_WARNINGS)
  target_compile_options(trinity-warning-interface
    INTERFACE
      -W
      -Wall
      -Wextra
      -Wimplicit-fallthrough
      -Winit-self
      -Wfatal-errors
      -Wno-mismatched-tags
      -Woverloaded-virtual
      -Wno-missing-field-initializers) # this warning is useless when combined with structure members that have default initializers

  message(STATUS "Clang: All warnings enabled")
endif()

if(WITH_COREDEBUG)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -g3)

  message(STATUS "Clang: Debug-flags set (-g3)")
endif()

if(ASAN)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=address
      -fsanitize-recover=address
      -fsanitize-address-use-after-scope)

  target_link_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=address
      -fsanitize-recover=address
      -fsanitize-address-use-after-scope)

  message(STATUS "Clang: Enabled Address Sanitizer ASan")
endif()

if(MSAN)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=memory
      -fsanitize-memory-track-origins
      -mllvm
      -msan-keep-going=1)

  target_link_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=memory
      -fsanitize-memory-track-origins)

  message(STATUS "Clang: Enabled Memory Sanitizer MSan")
endif()

if(UBSAN)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=undefined)

  target_link_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=undefined)

  message(STATUS "Clang: Enabled Undefined Behavior Sanitizer UBSan")
endif()

if(TSAN)
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=thread)

  target_link_options(trinity-compile-option-interface
    INTERFACE
      -fno-omit-frame-pointer
      -fsanitize=thread)

  message(STATUS "Clang: Enabled Thread Sanitizer TSan")
endif()

# -Wno-narrowing needed to suppress a warning in g3d
# -Wno-deprecated-register is needed to suppress 185 gsoap warnings on Unix systems.
# -Wno-deprecated-copy needed to suppress a warning in g3d
target_compile_options(trinity-compile-option-interface
  INTERFACE
    -Wno-narrowing
    -Wno-deprecated-register)

if(BUILD_SHARED_LIBS)
  # -fPIC is needed to allow static linking in shared libs.
  # -fvisibility=hidden sets the default visibility to hidden to prevent exporting of all symbols.
  target_compile_options(trinity-compile-option-interface
    INTERFACE
      -fPIC)

  target_compile_options(trinity-hidden-symbols-interface
    INTERFACE
      -fvisibility=hidden)

  # --no-undefined to throw errors when there are undefined symbols
  # (caused through missing TRINITY_*_API macros).
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --no-undefined")

  message(STATUS "Clang: Disallow undefined symbols")
endif()
