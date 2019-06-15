-- Fix trigger
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=35374;

-- Quest "Someone's Looking for You" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14269; -- Rogue
-- Quest "Your Instructor" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14265; -- Warior
-- Quest "Someone's Keeping Track of You" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14275; -- Hunter
-- Quest "Seek the Sister" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14278; -- Priest
-- Quest "Arcane Inquiries" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14277; -- Mage
-- Quest "Shady Associates" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14273; -- Worlock
-- Quest "The Winds Know Your Name... Apparently" requires quest "Royal Orders"
UPDATE `quest_template_addon` SET `PrevQuestID`=14099 WHERE `ID`=14280; -- Druid

-- Quest "Old Divisions " requires quest "Safety in numbers"
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14285;
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14286;
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14287;
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14288;
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14289;
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14290;
UPDATE `quest_template_addon` SET `NextQuestID`=14157 WHERE `ID`=14291;

-- Condition for source Quest available condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=24930 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 24930, 0, 1, 8, 0, 14285, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.'),
(19, 0, 24930, 0, 2, 8, 0, 14286, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.'),
(19, 0, 24930, 0, 3, 8, 0, 14287, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.'),
(19, 0, 24930, 0, 4, 8, 0, 14288, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.'),
(19, 0, 24930, 0, 5, 8, 0, 14289, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.'),
(19, 0, 24930, 0, 6, 8, 0, 14290, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.'),
(19, 0, 24930, 0, 7, 8, 0, 14291, 0, 0, 0, 0, 0, '', 'Quest While You''re At It available if quest Safety in Numbers has been rewarded.');

-- Condition for source Quest available condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=14159 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 14159, 0, 1, 8, 0, 28850, 0, 0, 0, 0, 0, '', 'Quest The Rebel Lord''s Arsenal available if quest The Prison Rooftop has been rewarded.'),
(19, 0, 14159, 0, 1, 8, 0, 24930, 0, 0, 0, 0, 0, '', 'Quest The Rebel Lord''s Arsenal available if quest While You''re At It has been rewarded.');

-- Bloodfang Worgen fix for quest 14266 "Charge", quest 14276 "Steady Shot", quest 14281 "Arcane Missle", quest 14274 "Immolate"
DELETE FROM `smart_scripts` WHERE `entryorguid`=35118 AND `source_type`=0 AND `id` IN (3,4,5,6);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35118,0,3,0,8,0,100,0,100,0,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,"Bloodfang Worgen - Spell Hit - Kill Credit"),
(35118,0,4,0,8,0,100,0,56641,0,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,"Bloodfang Worgen - Spell Hit - Kill Credit"),
(35118,0,5,0,8,0,100,0,7268,0,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,"Bloodfang Worgen - Spell Hit - Kill Credit"),
(35118,0,6,0,8,0,100,0,348,0,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,"Bloodfang Worgen - Spell Hit - Kill Credit");

-- Wounded Guard fix for quest 14279 "Flash Heal", quest 14283 "A Rejuvinating Touch"
SET @ENTRY := 47091;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,2061,0,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wounded Guard - Spell Hit - Kill Credit"),
(@ENTRY,0,1,0,8,0,100,0,774,0,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wounded Guard - Spell Hit - Kill Credit");

-- Fix Citizens
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (34936,35870,35873,35912,47091,51947);
