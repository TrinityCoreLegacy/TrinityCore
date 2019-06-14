-- Misc Fixes

-- Huntsman Blake <Hunter Trainer> SAI
SET @ENTRY := 36629;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,5000,60000,65000,0,12,36453,1,55000,0,0,0,8,0,0,0,-1865.71,2244.677,42.40661,2.08133,"Huntsman Blake - OOC - Summon Duskhaven Villager");

SET @ENTRY := 36453;
UPDATE `creature_template` SET `AIName`="", `ScriptName`='npc_duskhaven_villager' WHERE `entry` IN (@ENTRY);
UPDATE `creature_template_addon` SET auras='' WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-255464) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;

-- Pathing for Duskhaven Villager Entry: 36453
DELETE FROM `waypoint_data` WHERE `id`=364530;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`move_type`) VALUES
(364530,1,-1874.833,2258.868,42.44826,1),
(364530,2,-1894.193,2257.021,42.44826,1),
(364530,3,-1916.847,2239.845,40.91469,1),
(364530,4,-1927.254,2227.689,36.98933,1),
(364530,5,-1939.424,2230.359,36.1411,1),
(364530,6,-1941.524,2248.212,35.74326,1);

UPDATE `creature_template_addon` SET auras='69196' WHERE `entry` IN (36698,36797,36798);

UPDATE `creature_addon` SET `emote`=378 WHERE `guid` IN (255467,255471);
UPDATE `creature` SET `spawndist`=3 WHERE `guid` IN (255764);

UPDATE `gameobject_template_addon` SET `flags`=16 WHERE `entry` IN (196404,196411);
