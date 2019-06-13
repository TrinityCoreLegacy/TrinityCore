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

void AddSC_gilneas_c2()
{
    RegisterSpellScript(spell_gilneas_horrid_abomination_explosion);
}
