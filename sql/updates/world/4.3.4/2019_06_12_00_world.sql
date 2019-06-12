-- *** Fix quest "Last Stand" reward script & quest "Last Chance at Humanity" ***

-- Lord Darius Crowley SAI
SET @ENTRY := 35566;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `creature_addon` WHERE `guid`=377414;
UPDATE `creature_template_addon` SET `emote`=214 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,14222,0,0,0,0,85,97709,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Darius Crowley - Quest reward - Cast 'Altered Form (Racial)'"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,0,85,98274,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Darius Crowley - Quest reward - Cast 'Force Worgen Altered Form'"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,0,85,76642,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Darius Crowley - Quest reward - Cast 'Hideous Bite Wound'"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,0,85,68630,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Darius Crowley - Quest reward - Cast 'Curse of the Worgen'"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,0,85,72799,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Darius Crowley - Quest reward - Cast 'Last Stand Complete'"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,0,28,72872,0,0,0,0,0,7,0,0,0,0,0,0,0,"King Genn Greymane - quest complete - Remove aura");

-- Krennan Aranas SAI
SET @ENTRY := 36331;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krennan Aranas - OOC - Set Run off"),
(@ENTRY,0,1,0,1,0,100,1,1000,1000,0,0,0,4,23508,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krennan Aranas - OOC - Play Sound"),
(@ENTRY,0,2,0,1,0,100,1,1000,1000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-1819.53,2291.25,42.32689,0,"Krennan Aranas - OOC - Move to position"),
(@ENTRY,0,3,0,1,0,100,1,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krennan Aranas - OOC - Say 0"),
(@ENTRY,0,4,0,1,0,100,1,10000,10000,0,0,0,85,68632,0,0,0,0,0,23,0,0,0,0,0,0,0,"Krennan Aranas - OOC - Cast 'Forcecast Summon Personal Godfrey'"),
(@ENTRY,0,5,0,1,0,100,1,18000,18000,0,0,0,85,68634,0,0,0,0,0,23,0,0,0,0,0,0,0,"Krennan Aranas - OOC - Cast 'Forcecast Summon Personal Greymane'"),
(@ENTRY,0,6,0,8,0,100,0,68638,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krennan Aranas - On Spellhit - Despawn");

-- Lord Godfrey SAI
SET @ENTRY := 36330;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Godfrey - OOC - Set Run off"),
(@ENTRY,0,1,0,1,0,100,1,1000,1000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-1821.922,2295.05,42.17052,0,"Lord Godfrey - OOC - Move to position"),
(@ENTRY,0,2,0,1,0,100,1,10000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Godfrey - OOC - Say 0"),
(@ENTRY,0,3,0,8,0,100,0,68638,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Godfrey - On Spellhit - Despawn");

-- King Genn Greymane SAI
SET @ENTRY := 36332;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - OOC - Remove npcflag"),
(@ENTRY,0,1,0,1,0,100,1,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - OOC - Set Run off"),
(@ENTRY,0,2,0,1,0,100,1,100,100,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-1821.09,2292.597,42.23363,0,"King Genn Greymane - OOC - Move to position"),
(@ENTRY,0,3,0,1,0,100,1,11000,11000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.32645,"King Genn Greymane - OOC - Turn to"),
(@ENTRY,0,4,0,1,0,100,1,11100,11100,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - OOC - Say 0"),
(@ENTRY,0,5,0,1,0,100,1,21000,21000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - OOC - Say 1"),
(@ENTRY,0,6,0,1,0,100,1,23500,23500,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.497787,"King Genn Greymane - OOC - Turn to"),
(@ENTRY,0,7,0,1,0,100,1,24000,24000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - OOC - Add npcflag"),
(@ENTRY,0,8,0,8,0,100,0,68638,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Genn Greymane - On Spellhit - Despawn"),
(@ENTRY,0,9,10,20,0,100,0,14375,0,0,0,0,85,68638,2,0,0,0,0,23,0,0,0,0,0,0,0,"King Genn Greymane - quest complete - Cast'Worgen Intro Completion'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,0,85,68481,2,0,0,0,0,23,0,0,0,0,0,0,0,"King Genn Greymane - quest complete - Cast'Phase - Quest Zone-Specific 06'"),
(@ENTRY,0,11,12,61,0,100,0,0,0,0,0,0,28,68630,0,0,0,0,0,23,0,0,0,0,0,0,0,"King Genn Greymane - quest complete - Remove aura"),
(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,0,28,76642,0,0,0,0,0,23,0,0,0,0,0,0,0,"King Genn Greymane - quest complete - Remove aura");

-- Text for quest "Last Chance at Humanity"
DELETE FROM `creature_text` WHERE `CreatureID` IN (36330,36331,36332);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36330, 0, 0, 'Give it up, Krennan.  It''s time to put this one down.  It''s protocol.', 12, 0, 100, 274, 0, 19635, 36336, 'Lord Godfrey'),
(36331, 0, 0, 'I am not giving up on you.  I don''t have a cure for the Curse yet... but there are treatments.  You will have control again.', 12, 0, 100, 274, 0, 20919, 36344, 'Krennan Aranas'),
(36332, 0, 0, 'Tell me, Godfrey.  Those that stayed in Gilneas City so that we could live.  Were they following protocol?', 12, 0, 100, 1, 0, 19721, 36340, 'King Genn Greymane'),
(36332, 1, 0, 'I didn''t think so.  Now hand me that potion, Krennan... and double the dosage.', 12, 0, 100, 1, 0, 19722, 36341, 'King Genn Greymane');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup` IN (1) AND `SourceEntry` IN (69123,68632,68634) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 69123, 0, 0, 31, 0, 3, 36198, 255427, 0, 0, 0, '', 'Spell Curse of the Worgen will hit Generic Trigger LAB - Multiphase (Ground)'),
(13, 1, 68632, 0, 0, 31, 0, 3, 36198, 255423, 0, 0, 0, '', 'Spell Curse of the Worgen will hit Generic Trigger LAB - Multiphase (Ground)'),
(13, 1, 68634, 0, 0, 31, 0, 3, 36198, 255421, 0, 0, 0, '', 'Spell Curse of the Worgen will hit Generic Trigger LAB - Multiphase (Ground)');

-- *** Misc fixes ***
UPDATE `creature_template_addon` SET auras = '49414 69196' WHERE `entry` IN (36797,36798,36698);
DELETE FROM `creature_addon` WHERE `guid` IN (255440,255441,255449);
UPDATE `creature` SET `modelid`=30293 WHERE `id`=36698;
UPDATE `creature` SET `modelid`=30294 WHERE `id`=36797;
UPDATE `creature` SET `modelid`=30295 WHERE `id`=36798;

-- Multiphase triggers should be in all phases
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=395 WHERE `id` IN (36198,36286,36449);

-- Fixup Horrid Abomination
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `id`=36231;
UPDATE `creature` SET `position_x`=-1890.568,`position_y`=2380.472,`position_z`=30.00054,`orientation`=3.853235 WHERE `guid`=255764;

-- Set Citizen for some npcs
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (35566,35551,35552,35554,35911,44427,44455,44459,44460,44461,44463,44464,44465,44468,44469,44470);
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (36198);

-- Remove some overspawns
DELETE FROM `creature` WHERE `guid` IN (255781,255784,255766,255785,255464,376853,376826,376847,376836,376851,376829,376845,376810,376848,376857,376814,376834,376843,376839,376856,376811,376827,376852,376844,376813,376855,376858,376840);
DELETE FROM `creature_addon` WHERE `guid` IN (255781,255784,255766,255785,255464,376853,376826,376847,376836,376851,376829,376845,376810,376848,376857,376814,376834,376843,376839,376856,376811,376827,376852,376844,376813,376855,376858,376840);
DELETE FROM `creature_addon` WHERE `guid` IN (255501,255494,255483,255758,255762,255951);

-- Celestine of the Harvest <Druid Trainer> SAI
SET @ENTRY := 44459;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
UPDATE `creature_template_addon` SET `auras`="" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,11,13236,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celestine of the Harvest - OOC - Cast 'Nature Channeling'");

-- Vitus Darkwalker <Warlock Trainer> SAI
SET @ENTRY := 44469;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
UPDATE `creature_template_addon` SET `auras`="" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,11,45104,2,0,0,0,0,1,0,0,0,0,0,0,0,"Vitus Darkwalker - OOC - Cast 'Shadow Channelling'");
