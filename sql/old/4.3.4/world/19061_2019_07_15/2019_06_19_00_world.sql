-- Shadowy Figure SAI
SET @ENTRY := 34867;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-376334) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3486700) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-376334,0,0,0,1,0,100,0,11000,11000,20000,20000,0,80,3486700,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadowy Figure - OOC - Run Script"),
(3486700,9,0,0,0,0,100,0,0,0,0,0,0,97,30,20,0,0,0,0,1,0,0,0,-1506.569,1451.028,71.19758,0,"Shadowy Figure - Script - Jump to"),
(3486700,9,1,0,0,0,100,0,9000,9000,0,0,0,97,30,20,0,0,0,0,1,0,0,0,-1464.899,1450.804,71.7703,0,"Shadowy Figure - Script - Jump to");

UPDATE `creature` SET `position_x`=-1421.311, `position_y`=1409.007, `position_z`=63.29744, `orientation`=4.69669 WHERE `guid`=376319;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-376319) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3486701) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-376319,0,0,0,1,0,100,0,8000,8000,17000,17000,0,80,3486701,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadowy Figure - OOC - Run Script"),
(3486701,9,0,0,0,0,100,0,0,0,0,0,0,97,30,20,0,0,0,0,1,0,0,0,-1420.115,1433.424,71.2692,0,"Shadowy Figure - Script - Jump to"),
(3486701,9,1,0,0,0,100,0,9000,9000,0,0,0,97,30,20,0,0,0,0,1,0,0,0,-1421.311,1409.007,63.29744,0,"Shadowy Figure - Script - Jump to");

UPDATE `creature` SET `position_x`=-1488.443, `position_y`=1327.366, `position_z`=71.06258, `orientation`=0 WHERE `guid`=376306;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-376306) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3486702) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-376306,0,0,0,1,0,100,0,8000,8000,17000,17000,0,80,3486702,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadowy Figure - OOC - Run Script"),
(3486702,9,0,0,0,0,100,0,0,0,0,0,0,97,30,20,0,0,0,0,1,0,0,0,-1513.757,1319.587,72.68993,0,"Shadowy Figure - Script - Jump to"),
(3486702,9,1,0,0,0,100,0,9000,9000,0,0,0,97,30,20,0,0,0,0,1,0,0,0,-1488.443,1327.366,71.06258,0,"Shadowy Figure - Script - Jump to");

UPDATE `creature_addon` SET `bytes1`=8 WHERE `guid`=376284;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-376284) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3486703) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-376284,0,0,0,1,0,100,0,9000,9000,18000,18000,0,80,3486703,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadowy Figure - OOC - Run Script"),
(3486703,9,0,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-1421.56,1386.36,71.88211,0,"Shadowy Figure - Script - Move to"),
(3486703,9,1,0,0,0,100,0,9000,9000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-1421.68,1391.15,71.286,0,"Shadowy Figure - Script - Move to");

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-376323) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-376323,0,0,0,1,0,100,0,4000,5000,4000,5000,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadowy Figure - OOC - Emote 'OneShotRoar'");
