DELETE FROM `creature` WHERE `guid` IN (255483,255494,255501,255758,255762,255951);
DELETE FROM `creature_addon` WHERE `guid` IN (255483,255494,255501,255758,255762,255951);

-- Update currency drop
UPDATE `creature_template` SET `mingold`=1, `maxgold`=6 WHERE `entry`=35463;

UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (35112,35115,35233,35369,35550,35753,35907);

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup` IN (1) AND `SourceEntry` IN (68228) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 68228, 0, 0, 31, 0, 3, 35753, 0, 0, 0, 0, '', 'Spell Rescue Krennan will hit Krennan Aranas');

-- Krennan Aranas SAI
SET @ENTRY := 35907;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,0,11,46598,0,0,0,0,0,11,35905,10,1,0,0,0,0,"Krennan Aranas - OOC - Cast 'Ride Vehicle Hardcoded' No Repeat");

-- Add missing gameobject
DELETE FROM `gameobject` WHERE `guid`=200890;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseUseFlags`,`phaseMask`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`VerifiedBuild`) VALUES
(200890,195660,654,0,0,1,0,1,171,0,-1,-1676.16,1346.19,15.1349,0,0,0,-1,0,120,255,1, '', 0);

DELETE FROM `quest_template_addon` WHERE `ID`=14294;
INSERT INTO `quest_template_addon` (`ID`,`NextQuestID`) VALUES (14294,14212);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376793;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1732.675,`position_y`=1509.646,`position_z`=26.32375 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1732.675,1509.646,26.32375,0,0,1,0,100,0),
(@PATH,2,-1742.281,1513.167,26.32375,0,0,1,0,100,0),
(@PATH,3,-1756.868,1511.811,26.32375,0,0,1,0,100,0),
(@PATH,4,-1783.905,1511.462,20.35032,0,0,1,0,100,0),
(@PATH,5,-1791.332,1521.172,20.19476,0,0,1,0,100,0),
(@PATH,6,-1790.516,1529.174,20.91462,0,0,1,0,100,0),
(@PATH,7,-1791.332,1521.172,20.19476,0,0,1,0,100,0),
(@PATH,8,-1783.905,1511.462,20.35032,0,0,1,0,100,0),
(@PATH,9,-1756.868,1511.811,26.32375,0,0,1,0,100,0),
(@PATH,10,-1742.281,1513.167,26.32375,0,0,1,0,100,0),
(@PATH,11,-1732.675,1509.646,26.32375,0,0,1,0,100,0),
(@PATH,12,-1731.698,1491.403,24.57375,0,0,1,0,100,0),
(@PATH,13,-1729.241,1476.517,24.32375,0,0,1,0,100,0),
(@PATH,14,-1728.203,1465.093,24.52342,0,0,1,0,100,0),
(@PATH,15,-1729.241,1476.517,24.32375,0,0,1,0,100,0),
(@PATH,16,-1731.698,1491.403,24.57375,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376971;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1741.063,`position_y`=1583.623,`position_z`=20.60736 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1741.063,1583.623,20.60736,0,0,1,0,100,0),
(@PATH,2,-1746.629,1568.379,20.60736,0,0,1,0,100,0),
(@PATH,3,-1741.063,1583.623,20.60736,0,0,1,0,100,0),
(@PATH,4,-1726.3,1592.49,20.61042,0,0,1,0,100,0),
(@PATH,5,-1693.936,1592.41,20.61058,0,0,1,0,100,0),
(@PATH,6,-1686.005,1582.066,20.61058,0,0,1,0,100,0),
(@PATH,7,-1677.42,1574.189,20.61058,0,0,1,0,100,0),
(@PATH,8,-1666.663,1570.392,21.60212,0,0,1,0,100,0),
(@PATH,9,-1653.135,1578.052,21.67754,0,0,1,0,100,0),
(@PATH,10,-1641.554,1590.908,21.69789,0,0,1,0,100,0),
(@PATH,11,-1633.469,1601.528,21.68858,0,0,1,0,100,0),
(@PATH,12,-1642.217,1618.95,20.53271,0,0,1,0,100,0),
(@PATH,13,-1638.313,1620.822,20.53271,0,0,1,0,100,0),
(@PATH,14,-1631.468,1626.298,20.55082,0,0,1,0,100,0),
(@PATH,15,-1632.719,1625.297,20.70485,0,0,1,0,100,0),
(@PATH,16,-1642.217,1618.95,20.53271,0,0,1,0,100,0),
(@PATH,17,-1633.469,1601.528,21.68858,0,0,1,0,100,0),
(@PATH,18,-1641.554,1590.908,21.69789,0,0,1,0,100,0),
(@PATH,19,-1653.135,1578.052,21.67754,0,0,1,0,100,0),
(@PATH,20,-1666.663,1570.392,21.60212,0,0,1,0,100,0),
(@PATH,21,-1677.42,1574.189,20.61058,0,0,1,0,100,0),
(@PATH,22,-1686.005,1582.066,20.61058,0,0,1,0,100,0),
(@PATH,23,-1693.936,1592.41,20.61058,0,0,1,0,100,0),
(@PATH,24,-1726.3,1592.49,20.61042,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376870;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1805.958,`position_y`=1429.969,`position_z`=19.69318 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1805.958,1429.969,19.69318,0,0,1,0,100,0),
(@PATH,2,-1806.172,1447.116,19.08687,0,0,1,0,100,0),
(@PATH,3,-1805.958,1429.969,19.69318,0,0,1,0,100,0),
(@PATH,4,-1801.983,1406.764,19.94318,0,0,1,0,100,0),
(@PATH,5,-1797.465,1392.102,19.96923,0,0,1,0,100,0),
(@PATH,6,-1789.177,1376.415,19.95153,0,0,1,0,100,0),
(@PATH,7,-1776.201,1359.507,19.71486,0,0,1,0,100,0),
(@PATH,8,-1770.132,1346.964,19.86134,0,0,1,0,100,0),
(@PATH,9,-1771.911,1341.172,19.96486,0,0,1,0,100,0),
(@PATH,10,-1776.538,1336.762,19.96486,0,0,1,0,100,0),
(@PATH,11,-1771.911,1341.172,19.96486,0,0,1,0,100,0),
(@PATH,12,-1770.132,1346.964,19.86134,0,0,1,0,100,0),
(@PATH,13,-1776.201,1359.507,19.71486,0,0,1,0,100,0),
(@PATH,14,-1789.177,1376.415,19.95153,0,0,1,0,100,0),
(@PATH,15,-1797.465,1392.102,19.96923,0,0,1,0,100,0),
(@PATH,16,-1801.983,1406.764,19.94318,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376364;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1561.41,`position_y`=1319.868,`position_z`=35.61812 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1561.41,1319.868,35.61812,0,0,1,0,100,0),
(@PATH,2,-1544.602,1334.227,35.68091,0,0,1,0,100,0),
(@PATH,3,-1534.335,1354.188,36.11584,0,0,1,0,100,0),
(@PATH,4,-1527.672,1362.661,36.00175,0,0,1,0,100,0),
(@PATH,5,-1534.335,1354.188,36.11584,0,0,1,0,100,0),
(@PATH,6,-1544.602,1334.227,35.68091,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376325;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1555.754,`position_y`=1370.865,`position_z`=35.80885 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1555.754,1370.865,35.80885,0,0,1,0,100,0),
(@PATH,2,-1542.465,1384.807,36.00388,0,0,1,0,100,0),
(@PATH,3,-1542.089,1408.861,35.67107,0,0,1,0,100,0),
(@PATH,4,-1539.75,1416.844,35.67107,0,0,1,0,100,0),
(@PATH,5,-1533.207,1420.983,35.67107,0,0,1,0,100,0),
(@PATH,6,-1527.365,1418.911,35.67107,0,0,1,0,100,0),
(@PATH,7,-1528.009,1414.783,35.67107,0,0,1,0,100,0),
(@PATH,8,-1527.365,1418.911,35.67107,0,0,1,0,100,0),
(@PATH,9,-1533.207,1420.983,35.67107,0,0,1,0,100,0),
(@PATH,10,-1539.75,1416.844,35.67107,0,0,1,0,100,0),
(@PATH,11,-1542.089,1408.861,35.67107,0,0,1,0,100,0),
(@PATH,12,-1542.465,1384.807,36.00388,0,0,1,0,100,0),
(@PATH,13,-1555.754,1370.865,35.80885,0,0,1,0,100,0),
(@PATH,14,-1566.352,1366.95,35.90235,0,0,1,0,100,0),
(@PATH,15,-1574.606,1365.905,35.79102,0,0,1,0,100,0),
(@PATH,16,-1566.352,1366.95,35.90235,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376346;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1569.653,`position_y`=1401.129,`position_z`=36.55478 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1569.653,1401.129,36.55478,0,0,1,0,100,0),
(@PATH,2,-1559.446,1404.783,36.13107,0,0,1,0,100,0),
(@PATH,3,-1559.858,1411.417,35.92104,0,0,1,0,100,0),
(@PATH,4,-1559.969,1422.285,35.73098,0,0,1,0,100,0),
(@PATH,5,-1559.592,1429.635,35.8039,0,0,1,0,100,0),
(@PATH,6,-1555.533,1433.922,35.80046,0,0,1,0,100,0),
(@PATH,7,-1547.986,1438.767,35.89172,0,0,1,0,100,0),
(@PATH,8,-1538.747,1441.524,35.98832,0,0,1,0,100,0),
(@PATH,9,-1529.497,1441.524,35.99028,0,0,1,0,100,0),
(@PATH,10,-1524.859,1436.375,35.75562,0,0,1,0,100,0),
(@PATH,11,-1518.118,1436.016,35.73712,0,0,1,0,100,0),
(@PATH,12,-1507.276,1435.762,35.78053,0,0,1,0,100,0),
(@PATH,13,-1498.219,1436.427,35.81622,0,0,1,0,100,0),
(@PATH,14,-1492.83,1437.661,35.87214,0,0,1,0,100,0),
(@PATH,15,-1480.974,1437.476,35.8752,0,0,1,0,100,0),
(@PATH,16,-1474.759,1439.958,35.97214,0,0,1,0,100,0),
(@PATH,17,-1468.632,1440.254,35.97501,0,0,1,0,100,0),
(@PATH,18,-1454.483,1437.776,35.91162,0,0,1,0,100,0),
(@PATH,19,-1439.432,1437.24,35.90309,0,0,1,0,100,0),
(@PATH,20,-1430.311,1439.118,35.93962,0,0,1,0,100,0),
(@PATH,21,-1439.432,1437.24,35.90309,0,0,1,0,100,0),
(@PATH,22,-1449.774,1439.819,35.97038,0,0,1,0,100,0),
(@PATH,23,-1468.632,1440.254,35.97501,0,0,1,0,100,0),
(@PATH,24,-1474.759,1439.958,35.97214,0,0,1,0,100,0),
(@PATH,25,-1480.974,1437.476,35.8752,0,0,1,0,100,0),
(@PATH,26,-1492.83,1437.661,35.87214,0,0,1,0,100,0),
(@PATH,27,-1498.219,1436.427,35.81622,0,0,1,0,100,0),
(@PATH,28,-1507.276,1435.762,35.78053,0,0,1,0,100,0),
(@PATH,29,-1518.118,1436.016,35.73712,0,0,1,0,100,0),
(@PATH,30,-1524.859,1436.375,35.75562,0,0,1,0,100,0),
(@PATH,31,-1529.497,1441.524,35.99028,0,0,1,0,100,0),
(@PATH,32,-1538.747,1441.524,35.98832,0,0,1,0,100,0),
(@PATH,33,-1547.986,1438.767,35.89172,0,0,1,0,100,0),
(@PATH,34,-1555.533,1433.922,35.80046,0,0,1,0,100,0),
(@PATH,35,-1559.587,1429.743,35.78672,0,0,1,0,100,0),
(@PATH,36,-1559.969,1422.285,35.73098,0,0,1,0,100,0),
(@PATH,37,-1559.858,1411.417,35.92104,0,0,1,0,100,0),
(@PATH,38,-1559.446,1404.783,36.13107,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376254;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1465.648,`position_y`=1425.059,`position_z`=35.68091 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1465.648,1425.059,35.68091,0,0,1,0,100,0),
(@PATH,2,-1489.217,1426.361,35.6809,0,0,1,0,100,0),
(@PATH,3,-1492.634,1419.557,35.6809,0,0,1,0,100,0),
(@PATH,4,-1495.269,1408.132,35.6809,0,0,1,0,100,0),
(@PATH,5,-1496.313,1402.488,35.6809,0,0,1,0,100,0),
(@PATH,6,-1502.3,1380.554,35.68091,0,0,1,0,100,0),
(@PATH,7,-1500.208,1350.625,35.68091,0,0,1,0,100,0),
(@PATH,8,-1490.988,1347.622,35.68091,0,0,1,0,100,0),
(@PATH,9,-1461.733,1354.517,35.65739,0,0,1,0,100,0),
(@PATH,10,-1433.222,1362.076,35.57195,0,0,1,0,100,0),
(@PATH,11,-1401.542,1368.288,35.68092,0,0,1,0,100,0),
(@PATH,12,-1402.983,1385.648,35.68092,0,0,1,0,100,0),
(@PATH,13,-1402.665,1413.415,35.68092,0,0,1,0,100,0),
(@PATH,14,-1408.79,1421.288,35.68092,0,0,1,0,100,0),
(@PATH,15,-1416.502,1420.439,35.68092,0,0,1,0,100,0),
(@PATH,16,-1435.352,1423.688,35.68091,0,0,1,0,100,0),
(@PATH,17,-1448.543,1425.035,35.68091,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376594;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1768.821,`position_y`=1509.899,`position_z`=26.25432 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1768.821,1509.899,26.25432,0,0,1,0,100,0),
(@PATH,2,-1739.181,1511.401,26.32375,0,0,1,0,100,0),
(@PATH,3,-1734.373,1510.316,26.32375,0,0,1,0,100,0),
(@PATH,4,-1731.474,1501.769,26.07375,0,0,1,0,100,0),
(@PATH,5,-1731.075,1477.163,24.32375,0,0,1,0,100,0),
(@PATH,6,-1728.203,1465.093,24.52342,0,0,1,0,100,0),
(@PATH,7,-1731.075,1477.163,24.32375,0,0,1,0,100,0),
(@PATH,8,-1731.474,1501.769,26.07375,0,0,1,0,100,0),
(@PATH,9,-1734.373,1510.316,26.32375,0,0,1,0,100,0),
(@PATH,10,-1739.181,1511.401,26.32375,0,0,1,0,100,0),
(@PATH,11,-1768.263,1510.148,26.48897,0,0,1,0,100,0),
(@PATH,12,-1800.835,1513.023,19.81188,0,0,1,0,100,0),
(@PATH,13,-1791.67,1534.012,21.07098,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 377093;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1667.462,`position_y`=1673.46,`position_z`=20.52616 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1667.462,1673.46,20.52616,0,0,1,0,100,0),
(@PATH,2,-1672.214,1686.769,20.52616,0,0,1,0,100,0),
(@PATH,3,-1672.943,1696.335,20.7063,0,0,1,0,100,0),
(@PATH,4,-1663.714,1698.059,20.70621,0,0,1,0,100,0),
(@PATH,5,-1650.707,1703.95,20.70598,0,0,1,0,100,0),
(@PATH,6,-1626.844,1711.224,21.52482,0,0,1,0,100,0),
(@PATH,7,-1604.073,1711.686,22.00811,0,0,1,0,100,0),
(@PATH,8,-1589.385,1712.123,20.58986,0,0,1,0,100,0),
(@PATH,9,-1604.073,1711.686,22.00811,0,0,1,0,100,0),
(@PATH,10,-1626.844,1711.224,21.52482,0,0,1,0,100,0),
(@PATH,11,-1650.707,1703.95,20.70598,0,0,1,0,100,0),
(@PATH,12,-1663.714,1698.059,20.70621,0,0,1,0,100,0),
(@PATH,13,-1672.943,1696.335,20.7063,0,0,1,0,100,0),
(@PATH,14,-1672.214,1686.769,20.52616,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376918;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1805.278,`position_y`=1453.372,`position_z`=18.96187 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1805.278,1453.372,18.96187,0,0,1,0,100,0),
(@PATH,2,-1784.844,1453.62,19.47076,0,0,1,0,100,0),
(@PATH,3,-1769.745,1450.965,19.80365,0,0,1,0,100,0),
(@PATH,4,-1762.373,1440.735,21.21245,0,0,1,0,100,0),
(@PATH,5,-1752.705,1436.813,21.20775,0,0,1,0,100,0),
(@PATH,6,-1762.373,1440.735,21.21245,0,0,1,0,100,0),
(@PATH,7,-1769.745,1450.965,19.80365,0,0,1,0,100,0),
(@PATH,8,-1784.844,1453.62,19.47076,0,0,1,0,100,0),
(@PATH,9,-1805.278,1453.372,18.96187,0,0,1,0,100,0),
(@PATH,10,-1807.766,1468.694,19.09547,0,0,1,0,100,0),
(@PATH,11,-1806.795,1483.644,19.46486,0,0,1,0,100,0),
(@PATH,12,-1796.531,1485.988,19.91998,0,0,1,0,100,0),
(@PATH,13,-1783.182,1482.224,20.75935,0,0,1,0,100,0),
(@PATH,14,-1795.993,1481.496,19.8714,0,0,1,0,100,0),
(@PATH,15,-1803.819,1482.101,19.58986,0,0,1,0,100,0),
(@PATH,16,-1803.185,1482.052,19.60647,0,0,1,0,100,0),
(@PATH,17,-1783.182,1482.224,20.75935,0,0,1,0,100,0),
(@PATH,18,-1796.531,1485.988,19.91998,0,0,1,0,100,0),
(@PATH,19,-1806.795,1483.644,19.46486,0,0,1,0,100,0),
(@PATH,20,-1807.766,1468.694,19.09547,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376590;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1796.927,`position_y`=1485.245,`position_z`=19.91998 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1796.927,1485.245,19.91998,0,0,1,0,100,0),
(@PATH,2,-1801.064,1485.382,19.77467,0,0,1,0,100,0),
(@PATH,3,-1807.333,1480.75,19.46486,0,0,1,0,100,0),
(@PATH,4,-1806.361,1464.285,18.96187,0,0,1,0,100,0),
(@PATH,5,-1804.613,1453.677,18.96187,0,0,1,0,100,0),
(@PATH,6,-1780.55,1453.432,19.47076,0,0,1,0,100,0),
(@PATH,7,-1772.316,1451.8,19.60528,0,0,1,0,100,0),
(@PATH,8,-1770.599,1443.021,19.81134,0,0,1,0,100,0),
(@PATH,9,-1771.082,1427.149,19.84423,0,0,1,0,100,0),
(@PATH,10,-1769.361,1412.649,19.84423,0,0,1,0,100,0),
(@PATH,11,-1771.082,1427.149,19.84423,0,0,1,0,100,0),
(@PATH,12,-1770.599,1443.021,19.81134,0,0,1,0,100,0),
(@PATH,13,-1772.316,1451.8,19.60528,0,0,1,0,100,0),
(@PATH,14,-1780.55,1453.432,19.47076,0,0,1,0,100,0),
(@PATH,15,-1804.613,1453.677,18.96187,0,0,1,0,100,0),
(@PATH,16,-1806.361,1464.285,18.96187,0,0,1,0,100,0),
(@PATH,17,-1807.333,1480.75,19.46486,0,0,1,0,100,0),
(@PATH,18,-1801.064,1485.382,19.77467,0,0,1,0,100,0),
(@PATH,19,-1796.927,1485.245,19.91998,0,0,1,0,100,0),
(@PATH,20,-1782.12,1482.16,20.75955,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376761;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1757.061,`position_y`=1438.036,`position_z`=21.20659 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1757.061,1438.036,21.20659,0,0,1,0,100,0),
(@PATH,2,-1768.75,1450,19.97076,0,0,1,0,100,0),
(@PATH,3,-1784.694,1453.46,19.47076,0,0,1,0,100,0),
(@PATH,4,-1805.557,1453.422,18.96187,0,0,1,0,100,0),
(@PATH,5,-1807.859,1469.906,19.08424,0,0,1,0,100,0),
(@PATH,6,-1805.87,1485.004,19.46486,0,0,1,0,100,0),
(@PATH,7,-1796.22,1485.906,19.91998,0,0,1,0,100,0),
(@PATH,8,-1782.957,1481.631,20.76705,0,0,1,0,100,0),
(@PATH,9,-1795.834,1485.416,19.91998,0,0,1,0,100,0),
(@PATH,10,-1805.87,1485.004,19.46486,0,0,1,0,100,0),
(@PATH,11,-1807.859,1469.906,19.08424,0,0,1,0,100,0),
(@PATH,12,-1805.557,1453.422,18.96187,0,0,1,0,100,0),
(@PATH,13,-1784.694,1453.46,19.47076,0,0,1,0,100,0),
(@PATH,14,-1768.986,1450.738,20.013,0,0,1,0,100,0),
(@PATH,15,-1762.419,1441.152,21.21246,0,0,1,0,100,0),
(@PATH,16,-1757.275,1438.161,21.2084,0,0,1,0,100,0),
(@PATH,17,-1752.064,1436.736,21.20798,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376791;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1791.345,`position_y`=1379.814,`position_z`=19.84423 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1791.345,1379.814,19.84423,0,0,1,0,100,0),
(@PATH,2,-1796.825,1393.247,19.96923,0,0,1,0,100,0),
(@PATH,3,-1801.632,1406.686,19.94318,0,0,1,0,100,0),
(@PATH,4,-1805.833,1431.634,19.69318,0,0,1,0,100,0),
(@PATH,5,-1805.788,1448.085,19.08687,0,0,1,0,100,0),
(@PATH,6,-1805.833,1431.634,19.69318,0,0,1,0,100,0),
(@PATH,7,-1801.632,1406.686,19.94318,0,0,1,0,100,0),
(@PATH,8,-1796.825,1393.247,19.96923,0,0,1,0,100,0),
(@PATH,9,-1791.345,1379.814,19.84423,0,0,1,0,100,0),
(@PATH,10,-1776.524,1359.366,19.71486,0,0,1,0,100,0),
(@PATH,11,-1771.608,1354.194,19.83986,0,0,1,0,100,0),
(@PATH,12,-1769.931,1346.884,19.88575,0,0,1,0,100,0),
(@PATH,13,-1771.639,1340.946,19.96486,0,0,1,0,100,0),
(@PATH,14,-1776.781,1336.46,19.96486,0,0,1,0,100,0),
(@PATH,15,-1771.639,1340.946,19.96486,0,0,1,0,100,0),
(@PATH,16,-1769.931,1346.884,19.88575,0,0,1,0,100,0),
(@PATH,17,-1771.608,1354.194,19.83986,0,0,1,0,100,0),
(@PATH,18,-1776.524,1359.366,19.71486,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376485;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1641.677,`position_y`=1305.004,`position_z`=19.75987 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1641.677,1305.004,19.75987,0,0,1,0,100,0),
(@PATH,2,-1652.67,1305.075,19.88487,0,0,1,0,100,0),
(@PATH,3,-1666.644,1304.929,19.90446,0,0,1,0,100,0),
(@PATH,4,-1680.276,1301.379,20.28541,0,0,1,0,100,0),
(@PATH,5,-1688.962,1302.004,20.28532,0,0,1,0,100,0),
(@PATH,6,-1697.524,1303.384,20.28537,0,0,1,0,100,0),
(@PATH,7,-1715.347,1310.007,19.88487,0,0,1,0,100,0),
(@PATH,8,-1730.007,1319.62,19.88487,0,0,1,0,100,0),
(@PATH,9,-1731.238,1325.949,20.29388,0,0,1,0,100,0),
(@PATH,10,-1728.979,1333.681,20.29405,0,0,1,0,100,0),
(@PATH,11,-1731.392,1326.222,20.29347,0,0,1,0,100,0),
(@PATH,12,-1730.007,1319.62,19.88487,0,0,1,0,100,0),
(@PATH,13,-1715.347,1310.007,19.88487,0,0,1,0,100,0),
(@PATH,14,-1697.524,1303.384,20.28537,0,0,1,0,100,0),
(@PATH,15,-1688.962,1302.004,20.28532,0,0,1,0,100,0),
(@PATH,16,-1680.276,1301.379,20.28541,0,0,1,0,100,0),
(@PATH,17,-1666.644,1304.929,19.90446,0,0,1,0,100,0),
(@PATH,18,-1652.67,1305.075,19.88487,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376479;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1635.017,`position_y`=1317.004,`position_z`=19.75987 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1635.017,1317.004,19.75987,0,0,1,0,100,0),
(@PATH,2,-1636.866,1337.771,19.77329,0,0,1,0,100,0),
(@PATH,3,-1653.339,1337.465,15.25987,0,0,1,0,100,0),
(@PATH,4,-1660.661,1347.505,15.25987,0,0,1,0,100,0),
(@PATH,5,-1664.068,1363.939,15.25987,0,0,1,0,100,0),
(@PATH,6,-1662.373,1381.92,15.25987,0,0,1,0,100,0),
(@PATH,7,-1647.858,1395.302,19.75986,0,0,1,0,100,0),
(@PATH,8,-1636.024,1398.036,20.24961,0,0,1,0,100,0),
(@PATH,9,-1633.247,1389.969,20.24882,0,0,1,0,100,0),
(@PATH,10,-1632.951,1370.448,20.15922,0,0,1,0,100,0),
(@PATH,11,-1633.122,1352.337,20.1016,0,0,1,0,100,0),
(@PATH,12,-1632.951,1370.448,20.15922,0,0,1,0,100,0),
(@PATH,13,-1633.247,1389.969,20.24882,0,0,1,0,100,0),
(@PATH,14,-1636.024,1398.036,20.24961,0,0,1,0,100,0),
(@PATH,15,-1647.858,1395.302,19.75986,0,0,1,0,100,0),
(@PATH,16,-1662.373,1381.92,15.25987,0,0,1,0,100,0),
(@PATH,17,-1664.068,1363.939,15.25987,0,0,1,0,100,0),
(@PATH,18,-1660.661,1347.505,15.25987,0,0,1,0,100,0),
(@PATH,19,-1653.339,1337.465,15.25987,0,0,1,0,100,0),
(@PATH,20,-1637.5,1337.5,19.75986,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376972;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1762.969,`position_y`=1620.816,`position_z`=20.58675 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1762.969,1620.816,20.58675,0,0,1,0,100,0),
(@PATH,2,-1769.533,1608.811,20.58986,0,0,1,0,100,0),
(@PATH,3,-1779.17,1584.299,20.72902,0,0,1,0,100,0),
(@PATH,4,-1782.984,1571.293,20.71731,0,0,1,0,100,0),
(@PATH,5,-1780.158,1567.469,20.7065,0,0,1,0,100,0),
(@PATH,6,-1763.26,1566.944,20.70646,0,0,1,0,100,0),
(@PATH,7,-1780.158,1567.469,20.7065,0,0,1,0,100,0),
(@PATH,8,-1782.984,1571.293,20.71731,0,0,1,0,100,0),
(@PATH,9,-1779.17,1584.299,20.72902,0,0,1,0,100,0),
(@PATH,10,-1769.938,1603.05,20.72323,0,0,1,0,100,0),
(@PATH,11,-1769.791,1608.333,20.58986,0,0,1,0,100,0),
(@PATH,12,-1762.969,1620.816,20.58675,0,0,1,0,100,0),
(@PATH,13,-1758.198,1632.543,20.41561,0,0,1,0,100,0);

-- Pathing for Rat Entry: 4075 'TDB FORMAT' 
SET @NPC := 376556;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1774.872,`position_y`=1358.248,`position_z`=19.66261 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1774.872,1358.248,19.66261,0,0,1,0,100,0),
(@PATH,2,-1770.021,1344.467,19.96486,0,0,1,0,100,0),
(@PATH,3,-1776.594,1336.359,19.96486,0,0,1,0,100,0),
(@PATH,4,-1770.021,1344.467,19.96486,0,0,1,0,100,0),
(@PATH,5,-1774.872,1358.248,19.66261,0,0,1,0,100,0),
(@PATH,6,-1785.672,1372.094,19.93298,0,0,1,0,100,0),
(@PATH,7,-1796.901,1389.932,19.96923,0,0,1,0,100,0),
(@PATH,8,-1802.403,1406.177,19.94318,0,0,1,0,100,0),
(@PATH,9,-1805.76,1429.405,19.69318,0,0,1,0,100,0),
(@PATH,10,-1806.345,1446.811,19.08687,0,0,1,0,100,0),
(@PATH,11,-1805.76,1429.405,19.69318,0,0,1,0,100,0),
(@PATH,12,-1802.403,1406.177,19.94318,0,0,1,0,100,0),
(@PATH,13,-1796.901,1389.932,19.96923,0,0,1,0,100,0),
(@PATH,14,-1785.672,1372.094,19.93298,0,0,1,0,100,0);

-- Pathing for Spider Entry: 14881 'TDB FORMAT' 
SET @NPC := 255634;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1879.26,`position_y`=2228.043,`position_z`=42.36433 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1879.26,2228.043,42.36433,0,0,0,0,100,0),
(@PATH,2,-1873.161,2234.458,42.44826,0,0,0,0,100,0),
(@PATH,3,-1868.052,2240.559,42.44826,0,0,0,0,100,0),
(@PATH,4,-1873.161,2234.458,42.44826,0,0,0,0,100,0),
(@PATH,5,-1883.587,2224.359,42.36433,0,0,0,0,100,0),
(@PATH,6,-1889.781,2229.55,42.36433,0,0,0,0,100,0),
(@PATH,7,-1895.411,2234.71,42.44826,0,0,0,0,100,0),
(@PATH,8,-1889.781,2229.55,42.36433,0,0,0,0,100,0);

-- Pathing for Spider Entry: 14881 'TDB FORMAT' 
SET @NPC := 255456;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1873.151,`position_y`=2234.554,`position_z`=42.44826 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1873.151,2234.554,42.44826,0,0,0,0,100,0),
(@PATH,2,-1883.559,2224.349,42.36433,0,0,0,0,100,0),
(@PATH,3,-1889.524,2229.229,42.36433,0,0,0,0,100,0),
(@PATH,4,-1895.219,2234.422,42.44826,0,0,0,0,100,0),
(@PATH,5,-1889.524,2229.229,42.36433,0,0,0,0,100,0),
(@PATH,6,-1879.29,2228.083,42.36433,0,0,0,0,100,0),
(@PATH,7,-1873.151,2234.554,42.44826,0,0,0,0,100,0),
(@PATH,8,-1868.042,2240.632,42.44826,0,0,0,0,100,0);

-- Pathing for Spider Entry: 14881 'TDB FORMAT' 
SET @NPC := 255434;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1842.689,`position_y`=2278.988,`position_z`=48.27497 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1842.689,2278.988,48.27497,0,0,0,0,100,0),
(@PATH,2,-1847.047,2283.333,49.03751,0,0,0,0,100,0),
(@PATH,3,-1849.642,2287.963,48.9328,0,0,0,0,100,0),
(@PATH,4,-1851.476,2291.771,48.96492,0,0,0,0,100,0),
(@PATH,5,-1849.731,2288.122,48.95398,0,0,0,0,100,0),
(@PATH,6,-1842.689,2278.988,48.27497,0,0,0,0,100,0),
(@PATH,7,-1836.37,2272.158,48.34882,0,0,0,0,100,0),
(@PATH,8,-1832.123,2271.406,48.30512,0,0,0,0,100,0),
(@PATH,9,-1824.21,2273.556,48.25114,0,0,0,0,100,0),
(@PATH,10,-1817.017,2275.335,48.25078,0,0,0,0,100,0),
(@PATH,11,-1809.302,2280.799,48.25193,0,0,0,0,100,0),
(@PATH,12,-1805.602,2284.684,48.25217,0,0,0,0,100,0),
(@PATH,13,-1801.314,2289.156,48.25072,0,0,0,0,100,0),
(@PATH,14,-1805.602,2284.684,48.25217,0,0,0,0,100,0),
(@PATH,15,-1813.608,2277.016,48.25134,0,0,0,0,100,0),
(@PATH,16,-1824.21,2273.556,48.25114,0,0,0,0,100,0),
(@PATH,17,-1832.123,2271.406,48.30512,0,0,0,0,100,0),
(@PATH,18,-1836.37,2272.158,48.34882,0,0,0,0,100,0);

-- Pathing for Spider Entry: 14881 'TDB FORMAT' 
SET @NPC := 255624;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1836.592,`position_y`=2272.32,`position_z`=48.34455 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1836.592,2272.32,48.34455,0,0,0,0,100,0),
(@PATH,2,-1832.151,2271.344,48.30427,0,0,0,0,100,0),
(@PATH,3,-1824.215,2273.615,48.25111,0,0,0,0,100,0),
(@PATH,4,-1816.965,2275.339,48.25078,0,0,0,0,100,0),
(@PATH,5,-1809.373,2280.776,48.25191,0,0,0,0,100,0),
(@PATH,6,-1805.516,2284.726,48.25219,0,0,0,0,100,0),
(@PATH,7,-1801.293,2289.186,48.25072,0,0,0,0,100,0),
(@PATH,8,-1805.516,2284.726,48.25219,0,0,0,0,100,0),
(@PATH,9,-1813.514,2277.024,48.25136,0,0,0,0,100,0),
(@PATH,10,-1824.215,2273.615,48.25111,0,0,0,0,100,0),
(@PATH,11,-1832.151,2271.344,48.30427,0,0,0,0,100,0),
(@PATH,12,-1836.592,2272.32,48.34455,0,0,0,0,100,0),
(@PATH,13,-1842.696,2278.899,48.27398,0,0,0,0,100,0),
(@PATH,14,-1846.915,2283.431,49.03833,0,0,0,0,100,0),
(@PATH,15,-1849.677,2288.257,48.95483,0,0,0,0,100,0),
(@PATH,16,-1851.417,2291.882,48.96566,0,0,0,0,100,0),
(@PATH,17,-1849.677,2288.257,48.95483,0,0,0,0,100,0),
(@PATH,18,-1842.696,2278.899,48.27398,0,0,0,0,100,0);

-- Pathing for Spider Entry: 14881 'TDB FORMAT' 
SET @NPC := 256181;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2449.372,`position_y`=1442.729,`position_z`=16.84196 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2449.372,1442.729,16.84196,0,0,0,0,100,0),
(@PATH,2,-2457.76,1443.816,16.84196,0,0,0,0,100,0),
(@PATH,3,-2449.372,1442.729,16.84196,0,0,0,0,100,0),
(@PATH,4,-2438.205,1432.531,16.83308,0,0,0,0,100,0),
(@PATH,5,-2425.517,1421.375,16.81282,0,0,0,0,100,0),
(@PATH,6,-2417.76,1420.622,16.81282,0,0,0,0,100,0),
(@PATH,7,-2404.847,1422.139,16.81282,0,0,0,0,100,0),
(@PATH,8,-2417.76,1420.622,16.81282,0,0,0,0,100,0),
(@PATH,9,-2425.517,1421.375,16.81282,0,0,0,0,100,0),
(@PATH,10,-2438.205,1432.531,16.83308,0,0,0,0,100,0);

-- Pathing for Spider Entry: 14881 'TDB FORMAT' 
SET @NPC := 256172;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2471.892,`position_y`=1469.679,`position_z`=16.534 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2471.892,1469.679,16.534,0,0,0,0,100,0),
(@PATH,2,-2469.917,1457.314,16.34815,0,0,0,0,100,0),
(@PATH,3,-2468.474,1443.299,16.36622,0,0,0,0,100,0),
(@PATH,4,-2468.835,1426.043,16.30025,0,0,0,0,100,0),
(@PATH,5,-2466.413,1409.462,16.55086,0,0,0,0,100,0),
(@PATH,6,-2468.835,1426.043,16.30025,0,0,0,0,100,0),
(@PATH,7,-2468.474,1443.299,16.36622,0,0,0,0,100,0),
(@PATH,8,-2469.917,1457.314,16.34815,0,0,0,0,100,0);

