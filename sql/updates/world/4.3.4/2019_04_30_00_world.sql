--
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_mh_flamebreaker');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (75206, 'spell_mh_flamebreaker');
DELETE FROM `areatrigger_scripts` WHERE `entry`=5876;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES (5876, 'at_entrance_hyjal_barrow_dens');
UPDATE `creature_template` SET `ScriptName`='npc_archdruid_fandral_staghelm' WHERE `entry`=40180;
-- Faerie Dragon
UPDATE `creature_template` SET `AIName`='', `ScriptName`= 'npc_mh_faerie_dragon' WHERE `entry`= 39921;
DELETE FROM `smart_scripts` WHERE `entryorguid`=39921 AND `source_type`=0;
-- Twilight Inciter
UPDATE `creature_template` SET `DamageModifier`= 1.5, `flags_extra`= 2048 WHERE `entry`= 39926;
