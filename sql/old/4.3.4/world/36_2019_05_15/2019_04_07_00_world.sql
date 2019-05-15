--
DELETE FROM `item_template` WHERE `entry` = 18268;
INSERT INTO `item_template`(`entry`, `class`, `name`, `displayid`, `Quality`, `Flags`, `VerifiedBuild`) VALUES
(18268, 13, 'Gordok Inner Door Key', 3118, 1, 64, -15595);
UPDATE `creature_template` SET `unit_class`=2 WHERE `entry`=51088;
DELETE FROM `spell_proc` WHERE `SpellId` = 59891;
UPDATE `gameobject_template` SET `Data0` = 7363 WHERE `entry` IN (185316, 205253, 207282, 207283, 207284, 207285, 207282, 207326, 207350); -- temp spell while we can find proper spell
