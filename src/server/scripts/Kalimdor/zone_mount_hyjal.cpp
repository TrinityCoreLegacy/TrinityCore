/*
 * Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
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

#include "ScriptMgr.h"
#include "CombatAI.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "Map.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "SpellScript.h"
#include "TemporarySummon.h"
#include "Vehicle.h"
#include "WorldSession.h"

 /*######
 ## npc_mh_faerie_dragon
 ######*/

enum IncitingTheElements
{
    // Texts
    SAY_FEED_BERRIES                 = 0,
    SAY_FIGHT_INFILTRATOR            = 1,
    // Events
    EVENT_FIND_INFILTRATOR           = 1,
    // Move Points
    POINT_SUMMON_INFILTRATOR         = 1,
    // Spells
    SPELL_FEED_BERRIES               = 74513,
    SPELL_FORCECAST_SPOT_INFILTRATOR = 74515
};

class npc_mh_faerie_dragon : public CreatureScript
{
public:
    npc_mh_faerie_dragon() : CreatureScript("npc_mh_faerie_dragon") { }

    struct npc_mh_faerie_dragonAI : public ScriptedAI
    {
        npc_mh_faerie_dragonAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            _eventInProgress = false;
            me->GetMotionMaster()->MoveRandom(7.0f);
        }

        void SpellHit(Unit* caster, SpellInfo const* spell) override
        {
            if (!caster)
                return;

            if (spell->Id == SPELL_FEED_BERRIES && !_eventInProgress)
            {
                me->GetMotionMaster()->InitDefault();
                me->StopMoving();
                Talk(SAY_FEED_BERRIES, caster);
                _events.ScheduleEvent(EVENT_FIND_INFILTRATOR, 2s + 500ms);
                _actorGUID = caster->GetGUID();
                _eventInProgress = true;
            }
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
                return;

            if (id == POINT_SUMMON_INFILTRATOR)
            {
                if (Player* player = ObjectAccessor::FindPlayer(_actorGUID))
                {
                    Talk(SAY_FIGHT_INFILTRATOR, player);
                    DoCast(player, SPELL_FORCECAST_SPOT_INFILTRATOR);
                }
                me->DespawnOrUnsummon(3s);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            if (!_eventInProgress)
                return;

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_FIND_INFILTRATOR:
                    {
                        Position pos = me->GetPosition();
                        me->SetWalk(true);
                        me->MovePosition(pos, 30.0f, frand(0.0f, float(M_PI * 2)));
                        me->GetMotionMaster()->MovePoint(POINT_SUMMON_INFILTRATOR, pos);
                        break;
                    }
                    default:
                        break;
                }
            }
        }

    private:
        EventMap _events;
        ObjectGuid _actorGUID;
        bool _eventInProgress;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mh_faerie_dragonAI(creature);
    }
};

 /*######
 ## npc_archdruid_fandral_staghelm
 ######*/

enum ArchdruidFandralStaghelm
{
    QUEST_THROUGH_THE_DREAM        = 25325,
    NPC_ALYSRA                     = 40178,
    NPC_ARCHDRUID_FANDRAL_STAGHELM = 40180
};

class npc_archdruid_fandral_staghelm : public CreatureScript
{
public:
    npc_archdruid_fandral_staghelm() : CreatureScript("npc_archdruid_fandral_staghelm") { }

    struct npc_archdruid_fandral_staghelmAI : public ScriptedAI
    {
        npc_archdruid_fandral_staghelmAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            _scheduler.Schedule(Seconds(2), [this](TaskContext ownerCheck)
            {
                if (Player* player = ObjectAccessor::FindPlayer(_summoner))
                {
                    if (player->GetQuestStatus(QUEST_THROUGH_THE_DREAM) == QUEST_STATUS_NONE || player->GetQuestStatus(QUEST_THROUGH_THE_DREAM) == QUEST_STATUS_REWARDED)
                        me->DespawnOrUnsummon();
                }
                else
                    me->DespawnOrUnsummon();

                ownerCheck.Repeat(Seconds(2));
            });
        }

        void IsSummonedBy(Unit* summoner) override
        {
            if (Player* player = summoner->ToPlayer())
            {
                _summoner = player->GetGUID();
                me->SetReactState(REACT_PASSIVE);
                me->GetMotionMaster()->MoveFollow(player, 1, 0);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            _scheduler.Update(diff);
        }

    private:
        TaskScheduler _scheduler;
        ObjectGuid _summoner;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_archdruid_fandral_staghelmAI(creature);
    }
};

class at_entrance_hyjal_barrow_dens : public AreaTriggerScript
{
public:
    at_entrance_hyjal_barrow_dens() : AreaTriggerScript("at_entrance_hyjal_barrow_dens") { }

    bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/) override
    {
        ObjectGuid _summoner;
        std::list<Creature*> minionList;
        player->GetCreatureListWithEntryInGrid(minionList, NPC_ARCHDRUID_FANDRAL_STAGHELM, 5.0f);

        for (Creature* minion : minionList)
        {
            if (minion->IsSummon())
            {
                if (Unit* summoner = minion->ToTempSummon()->GetSummoner())
                {
                    if (summoner == player)
                    {
                        player->CompleteQuest(QUEST_THROUGH_THE_DREAM);
                        return true;
                    }
                }
            }
        }
        return false;
    }
};

enum Flamebreaker
{
    SPELL_INSTAKILL = 3617
};

class spell_mh_flamebreaker : public AuraScript
{
    PrepareAuraScript(spell_mh_flamebreaker);

    void HandleTick(AuraEffect const* /*aurEff*/)
    {
        PreventDefaultAction();
        Unit * caster = GetCaster();
        if (Unit* target = ObjectAccessor::GetCreature(*caster, caster->GetChannelObjectGuid()))
        {
            caster->CastSpell(target, GetSpellInfo()->Effects[EFFECT_0].TriggerSpell, true);
            target->CastSpell(target, SPELL_INSTAKILL);
        }
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_mh_flamebreaker::HandleTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
    }
};

void AddSC_mount_hyjal()
{
    new npc_mh_faerie_dragon();
    new npc_archdruid_fandral_staghelm();
    new at_entrance_hyjal_barrow_dens();
    RegisterAuraScript(spell_mh_flamebreaker);
}
