-- Quest The Rebel Lord''s Arsenal end script

-- Spell Script
DELETE FROM `spell_script_names` WHERE `spell_id` IN (67350);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(67350, 'spell_summon_josiah');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup` IN (1,4) AND `SourceEntry` IN (67350) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 67350, 0, 0, 31, 0, 3, 35374, 376589, 0, 0, 0, '', 'Spell Summon Josiah will hit Generic Trigger LAB - Multiphase'),
(13, 4, 67350, 0, 0, 31, 0, 3, 35374, 376589, 0, 0, 0, '', 'Spell Summon Josiah will hit Generic Trigger LAB - Multiphase');

DELETE FROM `creature_queststarter` WHERE `id`=35118;

-- Josiah Event Trigger SAI
SET @ENTRY := 50415;
UPDATE `creature_template` SET `AIName`="SmartAI", `flags_extra`=128 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,44,171,1,0,0,0,0,1,0,0,0,0,0,0,0,"Josiah Event Trigger - OOC - Set Phase 'No Repeat'"),
(@ENTRY,0,1,0,1,0,100,1,1500,1500,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Josiah Event Trigger - OOC - Say 0 'No Repeat'"),
(@ENTRY,0,2,0,1,0,100,1,4000,4000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Josiah Event Trigger - OOC - Despawn");
-- Josiah Event Trigger text
DELETE FROM `creature_text` WHERE `CreatureID` IN (50415);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(50415, 0, 0, 'You''ve been bitten by a worgen.  It''s probably nothing, but it sure stings a little.$B$B|TInterface\Icons\INV_Misc_monsterfang_02.blp:32|t', 42, 0, 100, 0, 0, 0, 50192, 'Josiah Event Trigger');

-- Josiah Avery SAI
SET @ENTRY := 35370;
UPDATE `creature_template` SET `AIName`="SmartAI", `flags_extra`=2 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,44,171,1,0,0,0,0,1,0,0,0,0,0,0,0,"Josiah Avery - OOC - Set Phase 'No Repeat'"),
(@ENTRY,0,1,0,1,0,100,1,200,200,0,0,0,11,42880,0,0,0,0,0,23,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Combat Attack 1H' 'No Repeat'"),
(@ENTRY,0,2,3,1,0,100,1,1700,1700,0,0,0,86,67593,0,10,376744,35378,0,1,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Shoot' 'No Repeat'"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,0,86,67357,2,10,376586,35374,0,23,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Pull-to' 'No Repeat'");

UPDATE `creature_template` SET `VehicleId`=494 WHERE `entry`=35905;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=35753;
DELETE FROM `creature_addon` WHERE `guid`=376850;
UPDATE `creature_template_addon` SET `emote`=472, `auras` = '49414' WHERE `entry`=35753;

UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=35118;

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (35504,35509));
UPDATE `creature_template_addon` SET `emote`=214 WHERE `entry`=35504;
UPDATE `creature_template_addon` SET `emote`=333 WHERE `entry`=35509;

UPDATE `creature_template_addon` SET `emote`=214 WHERE `entry`=35378;
DELETE FROM `creature_addon` WHERE `guid`=376744;

-- Quest "Time to Regroup" requires quest "Save Krennan Aranas"
UPDATE `quest_template_addon` SET `NextQuestID`=14294 WHERE `ID`=14293;

-- Gilneas City Guard SAI
SET @ENTRY := 35504;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gilneas City Guard - OOC - Prevent Combat Movement"),
(@ENTRY,0,1,0,0,0,100,0,0,2000,2000,3000,0,11,67595,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gilneas City Guard - In Combat - Cast 'Shoot'");

-- Gilneas City Guard SAI
SET @ENTRY := 35509;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gilneas City Guard - OOC - Prevent Combat Movement");

-- King Genn Greymane SAI
SET @ENTRY := 35550;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,14293,0,0,0,0,11,68232,0,0,0,0,0,7,0,0,0,0,0,0,0,"King Genn Greymane - On Quest Accept - Cast 'Forcecast Summon Greymane's Horse'");
