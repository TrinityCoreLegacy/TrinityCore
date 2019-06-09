-- Fix Citizens
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (35081,35123,35233,35112,35115,50371);

UPDATE `creature_template` SET `mingold`=1, `maxgold`=5 WHERE `entry` IN (34884,35118,35660);

DELETE FROM `creature_addon` WHERE `guid` IN (376397,376404,376570);

DELETE FROM `creature_addon` WHERE `guid` IN (376384,376386,376394,376456,376579,376582,376588);
INSERT INTO `creature_addon` (`guid`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(376384,0,1,173, ''),(376386,0,1,173, ''),(376394,0,1,173, ''),(376456,0,1,173, '');

UPDATE `creature_template_addon` SET `emote`=375 WHERE `entry`=34936;
UPDATE `creature_template_addon` SET `emote`=333 WHERE `entry`=50371;
UPDATE `creature_template_addon` SET `emote`=375 WHERE `entry`=35124;
UPDATE `creature_template_addon` SET `emote`=27 WHERE `entry`=35077;
UPDATE `creature_template_addon` SET `emote`=431 WHERE `entry`=35369;

DELETE FROM `creature` WHERE `guid` IN (376467,376468,376615,376627,376628,376638,376639,376640,376641,376642,376643,376644);
DELETE FROM `creature_addon` WHERE `guid` IN (376467,376468,376615,376627,376628,376638,376639,376640,376641,376642,376643,376644);

-- Condition for source Quest available condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=14159 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 14159, 0, 1, 8, 0, 26129, 0, 0, 0, 0, 0, '', 'Quest The Rebel Lord''s Arsenal available if quest Brothers In Arms has been rewarded.'),
(19, 0, 14159, 0, 1, 8, 0, 24930, 0, 0, 0, 0, 0, '', 'Quest The Rebel Lord''s Arsenal available if quest While You''re At It has been rewarded.');

UPDATE `gameobject` SET `PhaseGroup`=378 WHERE `id`=195430;

-- Lord Godfrey SAI
SET @ENTRY := 35115;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,24930,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Godfrey - On Quest Accept - Say 0");

DELETE FROM `creature_text` WHERE `CreatureID` IN (35115);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(35115, 0, 0, 'We ought TO LEAVE Crowley IN prison WITH those beasts!', 12, 0, 100, 0, 0, 0, 38601, 'Lord Godfrey');

-- Lord Darius Crowley SAI
SET @ENTRY := 35077;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,14154,0,0,0,0,11,66914,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lord Darius Crowley - On Quest Accept - Cast 'Gilneas - Quest - Gilneas Prison Periodic Forcecast'");

-- Josiah Avery SAI
SET @ENTRY := 35369;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,14159,0,0,0,0,11,67352,0,0,0,0,0,7,0,0,0,0,0,0,0,"Josiah Avery - On Quest Reward - Cast 'Force Cast Summon Josiah'");

UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=385 WHERE `id`=35374;
