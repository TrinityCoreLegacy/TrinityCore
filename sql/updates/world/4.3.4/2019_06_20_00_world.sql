--
DELETE FROM `spell_area` WHERE `spell`=49416 AND `area` IN (4757,4762);
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUE
(49416,4757,14099,14294,0,0,2,1,64,11),(49416,4762,14099,14293,0,0,2,1,64,9);

DELETE FROM `creature_text` WHERE `CreatureID` IN (35550);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35550, 0, 0, 'Hold the barricades!  Do not give them an inch!', 14, 0, 100, 0, 0, 19709, 36090, 'King Genn Greymane'),
(35550, 0, 1, 'Fire!', 14, 0, 100, 0, 0, 19710, 36091, 'King Genn Greymane'),
(35550, 0, 2, 'Keep them back!', 14, 0, 100, 0, 0, 19712, 36092, 'King Genn Greymane');

-- Josiah Avery SAI
SET @ENTRY := 35370;
UPDATE `creature_template` SET `AIName`="SmartAI", `flags_extra`=2 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,44,171,1,0,0,0,0,1,0,0,0,0,0,0,0,"Josiah Avery - OOC - Set Phase 'No Repeat'"),
(@ENTRY,0,1,0,1,0,100,1,100,100,0,0,0,11,42880,0,0,0,0,0,23,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Combat Attack 1H' 'No Repeat'"),
(@ENTRY,0,2,0,1,0,100,1,400,400,0,0,0,86,67357,0,10,376586,35374,0,23,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Pull-To' 'No Repeat'"),
(@ENTRY,0,3,4,1,0,100,1,1700,1700,0,0,0,86,67593,0,10,376744,35378,0,1,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Shoot' 'No Repeat'"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,0,86,67357,2,10,376586,35374,0,23,0,0,0,0,0,0,0,"Josiah Avery - OOC - Cast 'Pull-to' 'No Repeat'");

-- King Genn Greymane SAI
SET @ENTRY := 35550;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,14293,0,0,0,0,11,68232,0,0,0,0,0,7,0,0,0,0,0,0,0,"King Genn Greymane - On Quest Accept - Cast 'Forcecast Summon Greymane's Horse'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,0,11,49416,0,0,0,0,0,7,0,0,0,0,0,0,0,"King Genn Greymane - On Quest Accept - Cast 'Generic Quest Invisibility Detection 1'"),
(@ENTRY,0,2,0,1,0,100,0,75000,85000,75000,85000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - OOC - Say 0'");

DELETE FROM `creature_text` WHERE `CreatureID` IN (35550);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35550, 0, 0, 'Hold the barricades!  Do not give them an inch!', 14, 0, 100, 0, 0, 19709, 36090, 'King Genn Greymane'),
(35550, 0, 1, 'Fire!', 14, 0, 100, 0, 0, 19710, 36091, 'King Genn Greymane'),
(35550, 0, 2, 'Keep them back!', 14, 0, 100, 0, 0, 19712, 36092, 'King Genn Greymane');

UPDATE `creature_template_addon` SET `auras`='67503' WHERE `entry` IN (35124);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (67357);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(67357, 'spell_gilneas_pull_to');

-- Lorna Crowley SAI
SET @ENTRY := 35378;
UPDATE `creature_template` SET `AIName`="SmartAI",`flags_extra`=2 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,14204,0,0,0,0,11,68234,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lorna Crowley - quest Accepted - Cast 'Forcecast Mastiff'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lorna Crowley - quest Accepted - Say 0");

DELETE FROM `creature_text` WHERE `CreatureID` IN (35378);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35378, 0, 0, 'This mastiff will help you find the hidden worgen.', 12, 0, 100, 0, 0, 19696, 38744, 'Lorna Crowley');

UPDATE `gameobject_template_addon` SET `flags`=16 WHERE `entry` IN (195465,195466);
