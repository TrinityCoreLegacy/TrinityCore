-- All blood elfs areas + ghostlands
SET @Outrunner  := 44857;
SET @CreditKill := 44175;
SET @Dummy      := 44937;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Outrunner;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Dummy*100,@Outrunner*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Outrunner  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Outrunner, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Outrunner*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Outrunner - On spellHit - Action list'), -- Priest
(@Outrunner*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Outrunner - Action list - CreditKill'), -- Priest
(@Outrunner*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Outrunner - Action list - Remove bytes1'), -- Priest
(@Outrunner*100, 9, 2, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Outrunner - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 5, 0, 8, 0, 100, 0, 20271, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Paladin
(@Dummy, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

DELETE FROM `creature_queststarter` WHERE `id` IN (15294, 15298, 15273);
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry` IN (15294, 15298, 15273);
UPDATE `gameobject_template` SET `data1`=0 WHERE `entry`=181251;
UPDATE `gameobject_template_addon` SET `flags`=4 WHERE `entry`=181252;

-- Draenei starting areas
SET @Injured    := 16971;
SET @CreditKill := 44175;
SET @Dummy      := 44703;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 73899, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Chaman
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 20271, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Paladin
(@Dummy, 0, 5, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

DELETE FROM `creature_template_addon` WHERE `entry`=50306;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(50306,29255,0,1,0, '');
DELETE FROM npc_vendor WHERE `entry`=50306;
INSERT INTO npc_vendor (entry, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `TYPE`, `VerifiedBuild`) VALUES
(50306, 0, 45580, 0, 0, 0, 1, 0),
(50306, 1, 64889, 0, 0, 0, 1, 0),
(50306, 2, 64890, 0, 0, 0, 1, 0),
(50306, 3, 64891, 0, 0, 0, 1, 0),
(50306, 4, 67527, 0, 0, 0, 1, 0);

UPDATE `creature` SET `Position_x`=-3866.467041, `Position_y`=-11641.2626, `Position_z`=-137.657, `Orientation`=2.228626 WHERE `id`=17555;
UPDATE  `quest_template` SET `QuestSortID`=-141, `RequiredNpcOrGo2`=0, `RequiredNpcOrGoCount2`=0, `ObjectiveText2`="" WHERE `id` IN (10069,24528,26918,26966,27023);
UPDATE `creature` SET `spawntimesecs`=1 WHERE `id` IN (44703, 44937, 44794, 44548, 44171);

-- Undead starting areas
SET @Injured    := 44795;
SET @CreditKill := 44175;
SET @Dummy      := 44794;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 5, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Humain starting areas
SET @Injured    := 44564;
SET @CreditKill := 44175;
SET @Dummy      := 44548;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 5, 0, 8, 0, 100, 0, 20271, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Paladin
(@Dummy, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Gnomes starting areas
SET @Injured    := 42501;
SET @CreditKill := 44175;
SET @Dummy      := 44171;
UPDATE `creature` SET `curhealth`=765 WHERE `id`=42501;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');


-- Dwarf starting areas
SET @Injured    := 44405;
SET @CreditKill := 44175;
SET @Dummy      := 44389;
UPDATE `creature` SET `curhealth`=765 WHERE `id`=@Injured;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 20271, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Paladin
(@Dummy, 0, 5, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 6, 0, 8, 0, 100, 0, 73899, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Chaman
(@Dummy, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Night elfs starting areas
SET @Injured    := 44617;
SET @CreditKill := 44175;
SET @Dummy      := 44614;
UPDATE `creature` SET `curhealth`=765 WHERE `id`=@Injured;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured, 0, 1, 0, 8, 0, 100, 0, 774, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Druid
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest Druid
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest Druid
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Worgen starting areas
SET @Injured    := 47091;
SET @CreditKill := 44175;
UPDATE `creature` SET `curhealth`=765 WHERE `id`=@Injured;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured, 0, 1, 0, 8, 0, 100, 0, 774, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Druid
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest Druid
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade');

-- Goblin starting areas
SET @Injured    := 48305;
SET @CreditKill := 44175;
SET @Dummy      := 48304;
UPDATE `creature` SET `curhealth`=115 WHERE `id`=@Injured;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'), -- Priest
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 5, 0, 8, 0, 100, 0, 73899, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Chaman
(@Dummy, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Trolls starting areas
SET @Injured    := 47057;
SET @CreditKill := 44175;
SET @Dummy      := 38038;
UPDATE `creature` SET `curhealth`=765 WHERE `id`=@Injured;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured, 0, 1, 0, 8, 0, 100, 0, 774, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Druid
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest Druid
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'),
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 5, 0, 8, 0, 100, 0, 73899, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Chaman
(@Dummy, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Orcs starting areas
SET @CreditKill := 44175;
SET @Dummy      := 44820;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100)  AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 5143, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Mage
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 2098, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Rogue
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 4, 0, 8, 0, 100, 0, 348, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warlock
(@Dummy, 0, 5, 0, 8, 0, 100, 0, 73899, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Chaman
(@Dummy, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');

-- Taurens starting areas
SET @Injured    := 45199;
SET @CreditKill := 44175;
SET @Dummy      := 44848;
UPDATE `creature` SET `curhealth`=765 WHERE `id`=@Injured;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='' WHERE `entry`=@Dummy;
UPDATE `creature_template` SET `AIName`='SmartAI', `scriptName`='', `RegenHealth`=0 WHERE `entry`=@Injured;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Dummy  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (@Dummy*100,@Injured*100)  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Injured  AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Injured, 0, 0, 0, 8, 0, 100, 0, 2061, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Priest
(@Injured, 0, 1, 0, 8, 0, 100, 0, 774, 0, 30000, 30000, 80, @Injured*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - On spellHit - Action list'), -- Druid
(@Injured*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - CreditKill'), -- Priest Druid
(@Injured*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Remove bytes1'), -- Priest Druid
(@Injured*100, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured - Action list - Evade'),
(@Dummy, 0, 0, 0, 8, 0, 100, 0, 100, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Warrior
(@Dummy, 0, 1, 0, 8, 0, 100, 0, 56641, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- hunter
(@Dummy, 0, 2, 0, 8, 0, 100, 0, 73899, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Chaman
(@Dummy, 0, 3, 0, 8, 0, 100, 0, 20271, 0, 0, 0, 33, @CreditKill, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On spellHit - CreditKill'), -- Paladin
(@Dummy, 0, 4, 0, 11, 0, 100, 0, 0, 0, 0, 0, 116, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dummy - On respawn - set corpse delay');
