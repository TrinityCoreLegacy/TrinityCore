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
#include "MotionMaster.h"
#include "PassiveAI.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "TemporarySummon.h"
#include "SpellScript.h"
#include "SpellInfo.h"
#include "SpellAuras.h"
#include "World.h"

/*######
## Duskhaven Villager Entry: 36453
######*/

class npc_duskhaven_villager : public CreatureScript
{
public:
    npc_duskhaven_villager() : CreatureScript("npc_duskhaven_villager") { }

    struct npc_duskhaven_villagerAI : public ScriptedAI
    {
        npc_duskhaven_villagerAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override { }

        void IsSummonedBy(Unit* /*summoner*/) override
        {
            me->GetMotionMaster()->MovePath(me->GetEntry() * 10, false);
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type == WAYPOINT_MOTION_TYPE && id == 5)
                me->DespawnOrUnsummon();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_duskhaven_villagerAI(creature);
    }
};

/*######
##Quest 14348 - You Can't Take 'Em Alone
######*/

enum AbominationExplosion
{
    SPELL_RANDOM_CIRCUMFERENCE_POINT_POISON = 42266,
    SPELL_RANDOM_CIRCUMFERENCE_POINT_BONE   = 42267,
    SPELL_RANDOM_CIRCUMFERENCE_POINT_BONE_2 = 42274
};

// 68560 Gilneas - Horrid Abomination Explosion
class spell_gilneas_horrid_abomination_explosion : public SpellScript
{
    PrepareSpellScript(spell_gilneas_horrid_abomination_explosion);

    void HandleScriptEffect(SpellEffIndex /*effIndex*/)
    {
		// Cast 3 spells randonly 21 times.
        uint32 const ExplosionSpells[3] = { SPELL_RANDOM_CIRCUMFERENCE_POINT_POISON, SPELL_RANDOM_CIRCUMFERENCE_POINT_BONE, SPELL_RANDOM_CIRCUMFERENCE_POINT_BONE_2 };

        Unit* caster = GetCaster();

        for (int i = 0; i < 21; ++i)
            caster->CastSpell(caster, ExplosionSpells[urand(0, 2)], true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_gilneas_horrid_abomination_explosion::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

/*######
##Quest 14368 - Save the Children!
######*/

// 68596 Gilneas - Quest - Save James
class spell_gilneas_quest_save_james : public SpellScript
{
    PrepareSpellScript(spell_gilneas_quest_save_james);

    void HandleScriptEffect(SpellEffIndex /*effIndex*/)
    {
        if (Player* player = GetCaster()->ToPlayer())
            player->Talk(GetSpellInfo()->Effects[1].BasePoints, CHAT_MSG_SAY, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), player);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_gilneas_quest_save_james::HandleScriptEffect, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 68597 Gilneas - Quest - Save Cynthia
class spell_gilneas_quest_save_cynthia : public SpellScript
{
    PrepareSpellScript(spell_gilneas_quest_save_cynthia);

    void HandleScriptEffect(SpellEffIndex /*effIndex*/)
    {
        if (Player* player = GetCaster()->ToPlayer())
            player->Talk(GetSpellInfo()->Effects[0].BasePoints, CHAT_MSG_SAY, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), player);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_gilneas_quest_save_cynthia::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 68598 Gilneas - Quest - Save Ashley
class spell_gilneas_quest_save_ashley : public SpellScript
{
    PrepareSpellScript(spell_gilneas_quest_save_ashley);

    void HandleScriptEffect(SpellEffIndex /*effIndex*/)
    {
        if (Player* player = GetCaster()->ToPlayer())
            player->Talk(GetSpellInfo()->Effects[0].BasePoints, CHAT_MSG_SAY, sWorld->getFloatConfig(CONFIG_LISTEN_RANGE_SAY), player);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_gilneas_quest_save_ashley::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

void AddSC_gilneas_c2()
{
    new npc_duskhaven_villager();
    RegisterSpellScript(spell_gilneas_horrid_abomination_explosion);
    RegisterSpellScript(spell_gilneas_quest_save_james);
    RegisterSpellScript(spell_gilneas_quest_save_cynthia);
    RegisterSpellScript(spell_gilneas_quest_save_ashley);
}
