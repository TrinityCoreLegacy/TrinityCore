-- Fix Duskhaven phasing.

UPDATE `creature` SET `PhaseId`=181, `PhaseGroup`=0 WHERE `guid` IN
(255467,255453);
-- 429 Phases 181,182
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=429 WHERE `id` IN
(34571,36132,44125,36190,36798,36698,36797);
-- 429 Phases 181,182
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=429 WHERE `guid` IN
(255608,255469,255471);
-- 433 Phases 181,182,183,184
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=433 WHERE `id` IN
(36652,36631,36628,50247,50252,36695,36632,36630,38791,50567,50574,36629,36651,36717);
-- 433 Phases 181,182,183,184
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=433 WHERE `guid` IN
(255442,255460,255459);
-- 434 Phases 183,184
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=434 WHERE `id` IN
(36452);
-- 473 Phases 181,183,184
UPDATE `creature` SET `PhaseId`=0, `PhaseGroup`=473 WHERE `guid` IN
(255450,255954,255955,255953,255455,255437,255446,255433,255470,255468,255485,255486,255495,255484,255580,255575,255481,255477);
UPDATE `gameobject` SET `PhaseGroup`=431 WHERE `id`=196399;

-- More misc fixes
UPDATE `creature` SET `PhaseId`=182, `PhaseGroup`=0 WHERE `guid` IN  (255523,255525,255526);

UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (36456);
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (36449,36286);

DELETE FROM `creature` WHERE `guid` IN (255765,255768,255795,255767,255792,255794,255789,255791,255786,255793,255787,255790,255792,255771,255782,255959,255961,255956,255957,255788,255428);
DELETE FROM `creature_addon` WHERE `guid` IN (255765,255768,255795,255767,255792,255794,255789,255791,255786,255793,255787,255790,255792,255771,255782,255959,255961,255956,255957,255788,255428);

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid`=255873;

DELETE FROM `creature_addon` WHERE `guid` IN (255878);
UPDATE `creature_template_addon` SET `emote`=173 WHERE `entry` IN (36456);

-- Fix cellar door phasing
UPDATE `gameobject` SET `PhaseId`=181, `PhaseGroup`=0 WHERE `guid` IN  (235506);
UPDATE `gameobject` SET `PhaseId`=0, `PhaseGroup`=471 WHERE `guid` IN  (236400);

-- **** Fix quest 14313 "Among Humans Again" ****

-- Krennan Aranas SAI
SET @ENTRY := 36132;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3613200) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,14313,0,0,0,0,80,3613200,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krennan Aranas - quest complete - Run Script"),
(3613200,9,0,0,0,0,100,0,100,100,0,0,0,1,0,1,0,0,0,0,10,255442,34571,0,0,0,0,0,"Krennan Aranas - OOC - Gwen Armstead Say 0"),
(3613200,9,1,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Krennan Aranas - OOC - Say 0");

DELETE FROM `creature_text` WHERE `CreatureID` IN (34571,36132);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(34571, 0, 0, 'Welcome back, $N.  You were fortunate.  Krennan''s treatment doesn''t always work this well on people who''ve had the Curse as long as you.', 12, 0, 100, 1, 0, 0, 36618, 'Gwen Armstead'),
(36132, 0, 0, 'Do exercise caution.  Don''t expect anyone to invite you to their homes just yet.  But at least they won''t shoot you outright.', 12, 0, 100, 1, 0, 0, 36617, 'Krennan Aranas');

-- **** Fix quest 14320 "In Need of Ingredients" ****

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup` IN (2) AND `SourceEntry` IN (69296) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 2, 69296, 0, 0, 31, 0, 5, 197337, 0, 0, 0, 0, '', 'Spell Invasion Camera will hit gameobject Gilneas Invasion Camera');

-- **** Fix quest 14321 "Invasion" ****

-- Fix requirements
DELETE FROM `quest_template_addon` WHERE `ID`=14320;
INSERT INTO `quest_template_addon` (`ID`,`NextQuestID`) VALUES (14320,14321);

-- Slain Watchman SAI
SET @ENTRY := 36205;
UPDATE `creature_template` SET `AIName`="SmartAI",`flags_extra`=2 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,14321,0,0,0,0,85,68491,0,0,0,0,0,7,0,0,0,0,0,0,0,"Slain Watchman - quest accept - Cast 'Summon Forsaken Assassin'");

-- Forsaken Assassin SAI
SET @ENTRY := 36207;
UPDATE `creature_template` SET `AIName`="SmartAI",`mingold`=2,`maxgold`=6 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Forsaken Assassin - Just created - Say 0"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Forsaken Assassin - Just created - Attack Summoner");

DELETE FROM `creature_text` WHERE `CreatureID` IN (36207);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36207, 0, 0, 'Gilneas will soon belong to the Forsaken!', 12, 0, 100, 0, 0, 0, 36209, 'Forsaken Assassin');

-- Gwen Armstead SAI
SET @ENTRY := 34571;
UPDATE `creature_template` SET `AIName`="SmartAI",`flags_extra`=2 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,14321,0,0,0,0,85,97709,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gwen Armstead - quest reward - Cast 'Altered Form (Racial)'"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,0,85,98274,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gwen Armstead - quest reward - Cast 'Force Worgen Altered Form'"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,0,85,68482,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gwen Armstead - quest reward - Cast 'Phase - Quest Zone-Specific 07'"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,0,28,68481,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gwen Armstead - quest reward - Remove aura 'Phase - Quest Zone-Specific 06'");

-- **** Fix quest 14336 "Kill or Be Killed" ****
-- No fixes required

-- **** Fix quest 14347 "Hold the Line" ****

-- Fix requirements
DELETE FROM `quest_template_addon` WHERE `ID`=14347;
INSERT INTO `quest_template_addon` (`ID`,`PrevQuestID`) VALUES (14347,14336);

UPDATE `creature_template` SET `mingold`=2,`maxgold`=6 WHERE `entry` IN (34511);

UPDATE `creature` SET `spawntimesecs`=120 WHERE id=34511;

-- **** Fix quest 14348 "You Can't Take 'Em Alone" ****

-- Fix requirements
DELETE FROM `quest_template_addon` WHERE `ID`=14348;
INSERT INTO `quest_template_addon` (`ID`,`PrevQuestID`) VALUES (14348,14336);

-- Horrid Abomination SAI "Missing from combat https://www.wowhead.com/spell=68864/restitching"
SET @ENTRY := 36231;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3623100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0, 20,0,0,0,0,0,0,1,1,0,0,0,0,0,2,0,0,0,0,0,0,0, "Horrid Abomination - On aggro - Say 1"),
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
(36231, 1, 0, 'Get back here!  I smashes you!', 12, 0, 100, 0, 0, 20913, 36315, 'Horrid Abomination');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup` IN (1) AND `SourceEntry` IN (68558) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 68558, 0, 0, 31, 0, 3, 36140, 0, 0, 0, 0, '', 'Spell Gilneas - Quest - Abomination Kill Me will hit Prince Liam Greymane');

UPDATE `creature` SET `spawntimesecs`=120 WHERE id=36231;

-- **** Fix quest 14367 "The Allens' Storm Cellar" ****

-- Fix following quest availibility
UPDATE `quest_template_addon` SET `NextQuestID`=14396 WHERE `ID` IN (14386);
DELETE FROM `quest_template_addon` WHERE `ID`IN (14368,14369,14382);
INSERT INTO `quest_template_addon` (`ID`,`PrevQuestID`) VALUES
(14368,14367),(14369,14367),(14382,14367);

-- Condition for source Quest available condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=14386 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 14386, 0, 1, 8, 0, 14368, 0, 0, 0, 0, 0, '', 'Quest Leader of the Pack available if quest Save the Children! has been rewarded.'),
(19, 0, 14386, 0, 1, 8, 0, 14369, 0, 0, 0, 0, 0, '', 'Quest Leader of the Pack available if quest Unleash the Beast has been rewarded.'),
(19, 0, 14386, 0, 1, 8, 0, 14382, 0, 0, 0, 0, 0, '', 'Quest Leader of the Pack available if quest Two By Sea has been rewarded.');

-- **** Fix quest 14368 "Save the Children!" ****

-- Enable spell click
UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry` IN (36287,36288,36289);

-- Condition for source Spell click event condition type Quest taken
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36287 AND `SourceEntry`=68597 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 36287, 68597, 0, 0, 9, 0, 14368, 0, 0, 0, 0, 0, '', 'Spellclick unit Cynthia will cast spell Gilneas - Quest - Save Cynthia on player if quest Save the Children! has been taken.');

-- Condition for source Spell click event condition type Quest taken
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36288 AND `SourceEntry`=68598 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 36288, 68598, 0, 0, 9, 0, 14368, 0, 0, 0, 0, 0, '', 'Spellclick unit Ashley will cast spell Gilneas - Quest - Save Ashley on player if quest Save the Children! has been taken.');

-- Condition for source Spell click event condition type Quest taken
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=36289 AND `SourceEntry`=68596 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 36289, 68596, 0, 0, 9, 0, 14368, 0, 0, 0, 0, 0, '', 'Spellclick unit James will cast spell Gilneas - Quest - Save James on player if quest Save the Children! has been taken.');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (68596,68597,68598);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(68596, 'spell_gilneas_quest_save_james'),
(68597, 'spell_gilneas_quest_save_cynthia'),
(68598, 'spell_gilneas_quest_save_ashley');

UPDATE `creature` SET `spawntimesecs`=120 WHERE id IN (36289,36287,36288);

-- James SAI
SET @ENTRY := 36289;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3628900) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,68596,0,0,0,0,80,3628900,0,0,0,0,0,1,0,0,0,0,0,0,0, "James - On Spellhit - Run Script"),
(@ENTRY,0,1,2,58,0,100,0,5,362890,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"James - Path End - Remove unitflags"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,0,41,0,2,0,0,0,0,1,0,0,0,0,0,0,0,"James - Path End - Despawn"),
(@ENTRY,0,3,0,1,0,100,1,0,0,0,0,0,89,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"James - OOC Set random movement"),
(3628900,9,0,0,0,0,100,0,250,250,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0, "James - Script - Add unitflags"),
(3628900,9,1,0,0,0,100,0,250,250,0,0,0,33,36289,0,0,0,0,0,7,0,0,0,0,0,0,0, "James - Script - Killcredit"),
(3628900,9,2,0,0,0,100,0,2500,2500,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, "James - Script - Say 0"),
(3628900,9,3,0,0,0,100,0,3500,3500,0,0,0,53,1,362890,0,0,0,0,1,0,0,0,0,0,0,0, "James - Script - Load path");

DELETE FROM `creature_text` WHERE `CreatureID` IN (36289);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36289, 0, 0, 'Don''t hurt me!  I was just looking for my sisters!  I think Ashley''s inside that house!', 12, 0, 100, 0, 0, 0, 36324, 'James');

-- Waypoints for James
DELETE FROM `waypoints` WHERE `entry` IN (362890);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(362890,1,-1923.73,2540.082,1.76396, 'James'),
(362890,2,-1917.23,2546.082,1.76396, 'James'),
(362890,3,-1917.23,2549.082,1.76396, 'James'),
(362890,4,-1913.48,2555.332,1.76396, 'James'),
(362890,5,-1913.02,2558.333,1.51101, 'James');

-- Cynthia SAI
SET @ENTRY := 36287;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3628700) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,68597,0,0,0,0,80,3628700,0,0,0,0,0,1,0,0,0,0,0,0,0, "Cynthia - On Spellhit - Run Script"),
(@ENTRY,0,1,2,58,0,100,0,3,362870,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cynthia - Path End - Remove unitflags"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,0,41,0,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cynthia - Path End - Despawn"),
(@ENTRY,0,3,0,1,0,100,0,1500,1500,1500,1500,0,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cynthia - OOC - Play Emote 'OneShotCry'"),
(3628700,9,0,0,0,0,100,0,250,250,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0, "Cynthia - Script - Add unitflags"),
(3628700,9,1,0,0,0,100,0,250,250,0,0,0,33,36287,0,0,0,0,0,7,0,0,0,0,0,0,0, "Cynthia - Script - Killcredit"),
(3628700,9,2,0,0,0,100,0,2500,2500,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, "Cynthia - Script - Say 0"),
(3628700,9,3,0,0,0,100,0,3500,3500,0,0,0,53,1,362870,0,0,0,0,1,0,0,0,0,0,0,0, "Cynthia - Script - Load path");

DELETE FROM `creature_text` WHERE `CreatureID` IN (36287);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36287, 0, 0, 'You are scary!  I just want my mommy!', 12, 0, 100, 0, 0, 0, 36325, 'Cynthia');

-- Waypoints for Cynthia
DELETE FROM `waypoints` WHERE `entry` IN (362870);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(362870,1,-1970.007,2516.75,1.417366, 'Cynthia'),
(362870,2,-1947.472,2515.521,2.318746, 'Cynthia'),
(362870,3,-1926.536,2519.312,2.246772, 'Cynthia');

-- Ashley SAI
SET @ENTRY := 36288;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3628800) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,68598,0,0,0,0,80,3628800,0,0,0,0,0,1,0,0,0,0,0,0,0, "Ashley - On Spellhit - Run Script"),
(@ENTRY,0,1,2,58,0,100,0,7,362880,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ashley - Path End - Remove unitflags"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,0,41,0,2,0,0,0,0,1,0,0,0,0,0,0,0,"Ashley - Path End - Despawn"),
(3628800,9,0,0,0,0,100,0,250,250,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0, "Ashley - Script - Add unitflags"),
(3628800,9,1,0,0,0,100,0,250,250,0,0,0,33,36288,0,0,0,0,0,7,0,0,0,0,0,0,0, "Ashley - Script - Killcredit"),
(3628800,9,2,0,0,0,100,0,2500,2500,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, "Ashley - Script - Say 0"),
(3628800,9,3,0,0,0,100,0,3500,3500,0,0,0,53,1,362880,0,0,0,0,1,0,0,0,0,0,0,0, "Ashley - Script - Load path");

DELETE FROM `creature_text` WHERE `CreatureID` IN (36288);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36288, 0, 0, 'Are you one of the good worgen, $g mister:ma''am;?  Did you see Cynthia hiding in the sheds outside?', 12, 0, 100, 0, 0, 0, 36326, 'Ashley');

-- Waypoints for Ashley
DELETE FROM `waypoints` WHERE `entry` IN (362880);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(362880,1,-1927.698,2560.049,13.02533, 'Ashley'),
(362880,2,-1927.948,2559.049,13.02533, 'Ashley'),
(362880,3,-1927.948,2557.799,13.02533, 'Ashley'),
(362880,4,-1928.698,2554.299,13.02533, 'Ashley'),
(362880,5,-1923.283,2552.308,12.73568, 'Ashley'),
(362880,6,-1922.634,2553.704,12.9061, 'Ashley'),
(362880,7,-1920.023,2558.055,7.077039, 'Ashley');

-- **** Fix quest 14369 "Unleash the Beast" ****

UPDATE `creature` SET `spawntimesecs`=120 WHERE id=36236;
UPDATE `creature_template` SET `mingold`=2,`maxgold`=8 WHERE `entry` IN (36236);
