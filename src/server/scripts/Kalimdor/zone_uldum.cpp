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
#include "PhasingHandler.h"
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

// Easy Money Quest
enum UldumIntro
{
    PHASE_INTRO                       = 298,
    SPELL_INTRO_PLAYER_PREP           = 86750,
    SPELL_SUMMON_ADARRAH              = 86751,
    SPELL_SUMMON_CARAVAN              = 86752,
    SPELL_SUMMON_LADY_HUMPS           = 86753,
    SPELL_SUMMON_PACK_MULE            = 86754,
    SPELL_SUMMON_BUDDS_CAMEL          = 86755,
    SPELL_SUMMON_SAMIRS_CAMEL         = 86756,
    SPELL_SUMMON_MACKS_CAMEL          = 86757,
    SPELL_SUMMON_ADARRAHS_CAMEL       = 86758,
    SPELL_SUMMON_BEAM_TARGET_BUNNY    = 86942,
    SPELL_SUMMON_CLONED_IMAGE         = 86782,
    SPELL_INTRO_MIRROR_IMAGE_AURA     = 86784,
    SPELL_SUMMON_CAMERA_BUNNY         = 86792,
    SPELL_RIDE_VEHICLE_HARDCODED      = 46598,
    SPELL_PING_ALL_ACTORS_00          = 86843,
    SPELL_RIDE_VEHICLE_SEAT_2         = 82316,
    SPELL_RIDE_CAMERA_SEAT_3          = 81824,
    SPELL_SUMMON_BEAM_TARGET_BUNNY_02 = 86964
};

// 86748 - Initialize Uldum Intro
class spell_initialize_uldum_intro : public SpellScript
{
    PrepareSpellScript(spell_initialize_uldum_intro);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
        {
            // Does not work correctly if done in db
            PhasingHandler::AddPhase(player,PHASE_INTRO, true);
            player->CastSpell(player, SPELL_INTRO_PLAYER_PREP, true);
            player->CastSpell(player, SPELL_SUMMON_ADARRAH, true);
            player->CastSpell(player, SPELL_SUMMON_CARAVAN, true);
            player->CastSpell(player, SPELL_SUMMON_LADY_HUMPS, true);
            player->CastSpell(player, SPELL_SUMMON_PACK_MULE, true);
            player->CastSpell(player, SPELL_SUMMON_BUDDS_CAMEL, true);
            player->CastSpell(player, SPELL_SUMMON_SAMIRS_CAMEL, true);
            player->CastSpell(player, SPELL_SUMMON_MACKS_CAMEL, true);
            player->CastSpell(player, SPELL_SUMMON_ADARRAHS_CAMEL, true);
            player->CastSpell(player, SPELL_SUMMON_BEAM_TARGET_BUNNY, true);
            player->CastSpell(player, SPELL_SUMMON_CLONED_IMAGE, true);
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_initialize_uldum_intro::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 86783 - Reverse Cast Mirror Image
class spell_reverse_cast_mirror_image : public SpellScript
{
    PrepareSpellScript(spell_reverse_cast_mirror_image);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(player, SPELL_INTRO_MIRROR_IMAGE_AURA, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_reverse_cast_mirror_image::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 95747 - Player Summon Camera
class spell_uldum_player_summon_camera : public SpellScript
{
    PrepareSpellScript(spell_uldum_player_summon_camera);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(player, SPELL_SUMMON_CAMERA_BUNNY, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_uldum_player_summon_camera::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 82721 - Reverse Cast Ride Vehicle (HC) on Demon Creator
class spell_reverse_cast_ride_demon_creator : public SpellScript
{
    PrepareSpellScript(spell_reverse_cast_ride_demon_creator);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(GetCaster(), SPELL_RIDE_VEHICLE_HARDCODED, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_reverse_cast_ride_demon_creator::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 86848 - Master Ping All Actors
class spell_master_ping_all_actors : public SpellScript
{
    PrepareSpellScript(spell_master_ping_all_actors);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(player, SPELL_PING_ALL_ACTORS_00, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_master_ping_all_actors::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 82315 - Reverse Cast Ride - Seat 2 - Generic
class spell_reverse_cast_ride_seat_2 : public SpellScript
{
    PrepareSpellScript(spell_reverse_cast_ride_seat_2);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(GetCaster(), SPELL_RIDE_VEHICLE_SEAT_2, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_reverse_cast_ride_seat_2::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 84301 - Reverse Cast Ride Camera Bunny (Seat 3)
class spell_reverse_cast_ride_camera_bunny_seat_3 : public SpellScript
{
    PrepareSpellScript(spell_reverse_cast_ride_camera_bunny_seat_3);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(GetCaster(), SPELL_RIDE_CAMERA_SEAT_3, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_reverse_cast_ride_camera_bunny_seat_3::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 86960 - Master Summon Beam Target 02
class spell_master_summon_beam_target_02 : public SpellScript
{
    PrepareSpellScript(spell_master_summon_beam_target_02);

    void HandleScript(SpellEffIndex /*eff*/)
    {
        if (Player* player = GetHitUnit()->ToPlayer())
            player->CastSpell(player, SPELL_SUMMON_BEAM_TARGET_BUNNY_02, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_master_summon_beam_target_02::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

void AddSC_uldum()
{
    RegisterSpellScript(spell_gobbles_initialize);
    RegisterSpellScript(spell_summon_schnottz);
    RegisterSpellScript(spell_initialize_uldum_intro);
    RegisterSpellScript(spell_reverse_cast_mirror_image);
    RegisterSpellScript(spell_uldum_player_summon_camera);
    RegisterSpellScript(spell_reverse_cast_ride_demon_creator);
    RegisterSpellScript(spell_master_ping_all_actors);
    RegisterSpellScript(spell_reverse_cast_ride_seat_2);
    RegisterSpellScript(spell_reverse_cast_ride_camera_bunny_seat_3);
    RegisterSpellScript(spell_master_summon_beam_target_02);
}
