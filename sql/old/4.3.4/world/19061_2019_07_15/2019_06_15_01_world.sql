-- Horrid Abomination SAI
SET @ENTRY := 36231;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3623100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,50,10000,10000,0,11,68864,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - 50% HP - Cast 'Restitching'"),
(@ENTRY,0,1,2,8,0,100,1,69094,1,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, "Horrid Abomination - On Spellhit - Store Target Envoker"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,0,80,3623100,2,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - On Spellhit - Run Script"),
(3623100,9,0,0,0,0,100,0,0,0,0,0,0,18,2560,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - Add unitflags"),
(3623100,9,1,0,0,0,100,0,100,100,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - Root"),
(3623100,9,2,0,0,0,100,0,100,100,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - Say 0"),
(3623100,9,3,0,0,0,100,0,3800,3800,0,0,0,28,68555,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - Remove aura"),
(3623100,9,4,0,0,0,100,0,0,0,0,0,0,11,68560,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - Cast 'Gilneas - Horrid Abomination Explosion'"),
(3623100,9,5,0,0,0,100,0,0,0,0,0,0,33,36233,0,0,0,0,0,12,1,0,0,0,0,0,0, "Horrid Abomination - Script - Killcredit"),
(3623100,9,6,0,0,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - Add unitflags"),
(3623100,9,7,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0, "Horrid Abomination - Script - despawn");

DELETE FROM `creature_text` WHERE `CreatureID` IN (36231);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36231, 0, 0, 'GAH!!!!  I CAN''T SEE IN HERE!!!!', 12, 0, 100, 0, 0, 20908, 36310, 'Horrid Abomination'),
(36231, 0, 1, 'Barrel smell like gunpowder...', 12, 0, 100, 0, 0, 20909, 36311, 'Horrid Abomination'),
(36231, 0, 2, 'This not be good...', 12, 0, 100, 0, 0, 20910, 36312, 'Horrid Abomination'),
(36231, 0, 3, 'Uh-oh... this gonna hurts me...', 12, 0, 100, 0, 0, 20911, 36313, 'Horrid Abomination'),
(36231, 0, 4, 'I gots bad feeling...', 12, 0, 100, 0, 0, 20912, 36314, 'Horrid Abomination'),
(36231, 0, 5, 'Get back here!  I smashes you!', 12, 0, 100, 0, 0, 20913, 36315, 'Horrid Abomination');
