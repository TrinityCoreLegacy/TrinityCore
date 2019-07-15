-- Quest 14293 Save Krennan Aranas

-- King Greymane's Horse SAI
SET @ENTRY := 35905;
UPDATE `creature_template` SET `unit_flags`=16777224, `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `creature_template_addon` WHERE `entry` IN (35905);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`auras`) VALUES (35905,0,257, '');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3590500,3590501) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,513,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Greymane''s Horse - OOC - Set Reactstate Defensive"),
(@ENTRY,0,1,0,1,0,100,513,1000,1000,0,0,0,53,1,359050,0,0,0,0,1,0,0,0,0,0,0,0,"King Greymane''s Horse - OOC - Load path 359050"),
(@ENTRY,0,2,0,58,0,100,512,7,359050,0,0,0,80,3590500,2,0,0,0,0,1,0,0,0,0,0,0,0,"King Greymane''s Horse - Path End - Run Script 3590500"),
(@ENTRY,0,3,4,8,0,100,512,46598,0,0,0,0,80,3590501,2,0,0,0,0,1,0,0,0,0,0,0,0,"King Greymane''s Horse - Spell Hit - Run Script 3590501"),
(@ENTRY,0,4,0,61,0,100,512,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"King Greymane''s Horse - Spell Hit - Cast 'Vehicle Enter Dummy - LAB'"),
(@ENTRY,0,5,6,58,0,100,512,13,359051,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"King Greymane''s Horse - On Spellhit - Krennan Say 0"),
(@ENTRY,0,6,7,61,0,100,512,0,0,0,0,0,103,1,0,0,0,0,0,12,1,0,0,0,0,0,0,"King Greymane''s Horse - On Missing Aura - Krennan Root"),
(@ENTRY,0,7,8,61,0,100,512,0,0,0,0,0,41,6000,0,0,0,0,0,12,1,0,0,0,0,0,0,"King Greymane''s Horse - On Missing Aura - Krennan Despawn"),
(@ENTRY,0,8,9,61,0,100,512,0,0,0,0,0,11,78690,0,0,0,0,0,23,0,0,0,0,0,0,0,"King Greymane''s Horse - Path End - Cast 'Update Cathedral Auras and Sanctuary'"),
(@ENTRY,0,9,0,61,0,100,512,0,0,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"King Greymane''s Horse - Path End - Cast 'Eject All Passengers'"),
(3590500,9,0,0,0,0,100,512,0,0,0,0,0,97,20,10,0,0,0,0,1,0,0,0,-1676.16,1346.19,15.1349,0,"King Greymane''s Horse - Script - Jump to"),
(3590500,9,1,0,0,0,100,512,2000,2000,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"King Greymane''s Horse - Script - Say 0"),
(3590500,9,2,0,0,0,100,512,200,200,0,0,0,1,0,0,0,0,0,0,10,376850,35753,0,0,0,0,0,"King Greymane''s Horse - Script - Krennan Aranas Say 0"),
(3590501,9,0,0,0,0,100,512,1000,1000,0,0,0,53,1,359051,0,0,0,0,1,0,0,0,0,0,0,0,"King Greymane''s Horse - Script - Load path 359051");

DELETE FROM `creature_text` WHERE `CreatureID` IN (35905,35753);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35905, 0, 0, 'Rescue Krennan Aranas by using your vehicle''s ability.$B|TInterface\Icons\inv_misc_groupneedmore.blp:64|t', 42, 0, 100, 0, 0, 0, 36078, 'King Greymane''s Horse'),
(35753, 0, 0, 'Help!  Up here!', 14, 0, 100, 0, 0, 20921, 46756, 'Krennan Aranas');

-- Waypoints for King Greymane's Horse
DELETE FROM `waypoints` WHERE `entry` IN (359050,359051);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(359050,1,-1797.642,1396.965,20.05484, 'King Greymane''s Horse'),
(359050,2,-1788.642,1378.465,20.05484, 'King Greymane''s Horse'),
(359050,3,-1780.892,1368.965,20.05484, 'King Greymane''s Horse'),
(359050,4,-1767.392,1358.215,19.80484, 'King Greymane''s Horse'),
(359050,5,-1746.392,1358.715,20.05484, 'King Greymane''s Horse'),
(359050,6,-1726.142,1354.215,20.05484, 'King Greymane''s Horse'),
(359050,7,-1709.064,1348.535,19.78232, 'King Greymane''s Horse'),
(359051,1,-1664.808,1345.011,15.48524, 'King Greymane''s Horse'),
(359051,2,-1662.808,1354.511,15.48524, 'King Greymane''s Horse'),
(359051,3,-1667.308,1362.511,15.48524, 'King Greymane''s Horse'),
(359051,4,-1674.308,1363.761,15.48524, 'King Greymane''s Horse'),
(359051,5,-1686.058,1355.011,15.48524, 'King Greymane''s Horse'),
(359051,6,-1691.058,1347.261,15.48524, 'King Greymane''s Horse'),
(359051,7,-1705.808,1350.011,19.98524, 'King Greymane''s Horse'),
(359051,8,-1731.308,1360.011,19.98524, 'King Greymane''s Horse'),
(359051,9,-1744.808,1370.511,20.23524, 'King Greymane''s Horse'),
(359051,10,-1758.808,1389.511,19.98524, 'King Greymane''s Horse'),
(359051,11,-1768.308,1410.011,19.98524, 'King Greymane''s Horse'),
(359051,12,-1771.558,1423.011,19.98524, 'King Greymane''s Horse'),
(359051,13,-1770.955,1430.332,19.83506, 'King Greymane''s Horse');

-- Krennan Aranas SAI
SET @ENTRY := 35907;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,500,500,0,0,0,11,46598,0,0,0,0,0,11,35905,10,1,0,0,0,0,"Krennan Aranas - OOC - Cast 'Ride Vehicle Hardcoded' (No Repeat)");

-- Krennan Aranas text
DELETE FROM `creature_text` WHERE `CreatureID` IN (35907);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35907, 0, 0, 'Thank you!  I owe you my life.', 12, 0, 100, 0, 0, 20922, 38729, 'Krennan Aranas');

-- King Genn Greymane SAI
SET @ENTRY := 35911;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,14294,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"King Genn Greymane - On Quest Accept - Say 0");

DELETE FROM `creature_text` WHERE `CreatureID` IN (35911);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35911, 0, 0, 'If we can make it past the gates into Duskhaven we''ll be safe.  The eastern mountains are virtually impassable.', 12, 0, 100, 1, 0, 19719, 36107, 'Lord Godfrey');

-- Lord Godfrey SAI
SET @ENTRY := 35906;
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=367 WHERE `id` IN (@ENTRY);
UPDATE `creature_template` SET `AIName`="SmartAI",`flags_extra`=2 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,14293,0,0,0,0,85,72872,2,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Godfrey - On Quest Reward - Cast 'Infected Bite'"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,0,28,72870,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Godfrey - On Quest Reward - Remove Aura 'Worgen Bite'"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,0,11,93555,2,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Godfrey - On Quest Reward - Cast 'Forcecast Cannon Camera'"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Godfrey - On Quest Reward - Say 0");

DELETE FROM `creature_text` WHERE `CreatureID` IN (35906);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35906, 0, 0, 'We''ve got Aranas!  Fire at will!', 14, 0, 100, 0, 0, 19634, 36099, 'Lord Godfrey');
