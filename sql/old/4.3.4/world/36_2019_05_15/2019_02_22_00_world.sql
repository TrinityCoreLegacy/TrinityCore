-- 
DELETE FROM `gameobject_addon`  WHERE `guid` IN (150377,150378);
UPDATE `creature` SET `equipment_id`=0 WHERE `guid`=259404;
UPDATE `creature_template` SET `npcflag`=131 WHERE `entry`=1261;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=8891;
DELETE FROM `player_factionchange_items` WHERE `alliance_id`=30622;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=1043;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1043;
UPDATE `smart_scripts` SET `action_param1`=170 WHERE `entryorguid` IN (-91106, -91107) AND `source_type`=0 AND `id`=3;
