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
#include "CreatureAIImpl.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellMgr.h"
#include "GridNotifiersImpl.h"

 // Gobbles! Quest
enum SummonSchnottz
{
    NPC_SCHNOTTZ                  = 47159,
    SPELL_SUMMON_SCHNOTTZ_00      = 88108,
    SPELL_SUMMON_VEVAH            = 88109,
    SPELL_PHASE_PLAYER            = 88111
};

// 88107 - Gobbles Initialize
class spell_gobbles_initialize : public SpellScript
{
    PrepareSpellScript(spell_gobbles_initialize);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
        {
            // Does not work correctly if done in db
            player->CastSpell(player, SPELL_SUMMON_SCHNOTTZ_00);
            player->CastSpell(player, SPELL_SUMMON_VEVAH);
            player->CastSpell(player, SPELL_PHASE_PLAYER);
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_gobbles_initialize::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 88108 - Summon Schnottz
class spell_summon_schnottz : public SpellScript
{
    PrepareSpellScript(spell_summon_schnottz);

    void SetDest(SpellDestination& dest)
    {
        if (Creature * Schnottz = GetCaster()->FindNearestCreature(NPC_SCHNOTTZ, 10.0f, true))
            dest.Relocate(Schnottz->GetPosition());
    }

    void Register() override
    {
        OnDestinationTargetSelect += SpellDestinationTargetSelectFn(spell_summon_schnottz::SetDest, EFFECT_0, TARGET_DEST_NEARBY_ENTRY);
    }
};

void AddSC_uldum()
{
    RegisterSpellScript(spell_gobbles_initialize);
    RegisterSpellScript(spell_summon_schnottz);
}
