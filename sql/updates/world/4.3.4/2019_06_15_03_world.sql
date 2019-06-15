-- Fix Gilneas terrain swapping
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 25 AND `SourceEntry` IN (638,655,656);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `NegativeCondition`, `Comment`) VALUES 
(25, 638, 8, 0, 14386, 1, 'Terrainwap: Gineas character start terrain'),
(25, 655, 8, 0, 14386, 0, 'Terrainwap: Gineas farmstead sunk terrain'),
(25, 655, 8, 0, 14466, 1, 'Terrainwap: Gineas farmstead sunk terrain'),
(25, 656, 8, 0, 14466, 0, 'Terrainwap: Gineas duskhaven sunk terrain');
DELETE FROM `terrain_swap_defaults` WHERE `MapId`=654;
INSERT INTO `terrain_swap_defaults` (`MapId`,`TerrainSwapMap`,`Comment`) VALUES
(654, 638, 'Gilneas character start terrain'),(654, 655, 'Gineas farmstead sunk terrain'),(654, 656, 'Gineas duskhaven sunk terrain');
