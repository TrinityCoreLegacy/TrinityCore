--
DELETE FROM `spell_proc` WHERE `SpellId`= 56453;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyMask1`, `SpellPhaseMask`, `HitMask`) VALUES
(56453, 0x80000000, 1, 0);

UPDATE `creature_template` SET `mechanic_immune_mask` = 617299839, `flags_extra` = 1073741824 WHERE `entry` = 54525;
