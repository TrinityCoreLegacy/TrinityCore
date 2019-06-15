-- 
UPDATE `creature_template` SET `ScriptName`="" WHERE `entry`=10556;
DELETE FROM `spell_script_names` WHERE `ScriptName` = "spell_pos_ice_shards";
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (69425, "spell_pos_ice_shards");
