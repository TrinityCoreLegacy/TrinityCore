/*
-- 
DELETE FROM `creature` WHERE `guid` IN (86845,86846,86847,86851,86852,86853,86854,86855,86857);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(86845, 28987, 0, 1, 1, 0, 0, -10897, -379, 40.018, 2.893, 300, 0, 0, 0, 0, 0),
(86846, 1001, 0, 1, 1, 0, 0, -10912, -388, 40.632, 0.812, 300, 0, 0, 0, 0, 0),
(86847, 1098, 0, 1, 1, 0, 0, -10533, -1128, 26.287, 4.084, 300, 0, 0, 0, 0, 0),
(86851, 1099, 0, 1, 1, 0, 0, -10531, -1129, 26.093, 3.882, 300, 0, 0, 0, 0, 0),
(86852, 1100, 0, 1, 1, 0, 0, -10526, -1128, 26.277, 3.621, 300, 0, 0, 0, 0, 0),
(86853, 1101, 0, 1, 1, 0, 0, -10533, -1124, 26.347, 4.318, 300, 0, 0, 0, 0, 0),
(86854, 1203, 0, 1, 1, 0, 0, -10552.4, -1316.49, 43.5212, 0.063056, 300, 0, 0, 0, 0, 0),
(86855, 1204, 0, 1, 1, 0, 0, -10584, -1173, 28.568, 6.069, 300, 0, 0, 0, 0, 0),
(86857, 1436, 0, 1, 1, 0, 0, -10929, -386, 40.186, 0.816, 300, 0, 0, 0, 0, 0);

UPDATE `creature` SET `spawndist`=0 AND `MovementType`=0 WHERE  `guid` IN (6133,6127);
*/