-- Uldum fixes
DELETE FROM `creature` WHERE `guid` IN (264000,264435,264289,264414,264997);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(264000,47690,1,0,0,1,1,169,0,0,0,-10383.3,1074.79,64.9967,5.16617,120,0,0,1,0,0,0,0,0,'',0),
(264435,48204,1,5034,5668,1,1,169,0,0,0,-8753.06,13.0833,141.145,5.16617,120,0,0,1,0,0,0,0,0,'',0);

DELETE FROM `creature_addon` WHERE `guid` IN (265001,264418,264421,264431,264429);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(265001,0,0,8,1,0, ''),(264418,0,0,8,1,0, ''),(264421,0,0,8,1,0, ''),(264431,0,0,8,1,0, ''),(264429,0,0,8,1,0, '');
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `id` IN (1933,45321,49727,49732,49743,49832,49835,51675);
UPDATE `creature` SET `spawndist`=10, `MovementType`=1 WHERE `id` IN (45302,45353,45859,45905,47283,47720,47801,47803,51193,51671,51672,51673,51674,51712,51713);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (47546,48214,49528);
UPDATE `creature_template_addon` SET `mount`=37212 WHERE `entry`=45905;
UPDATE `creature_template_addon` SET `bytes1`=0 WHERE `entry` IN (47291,48204);
DELETE FROM `smart_scripts` WHERE `entryorguid`=49528;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=49528;

UPDATE `creature_template_addon` SET `path_id`=0,`auras`='' WHERE `entry`=47546;
DELETE FROM `creature_addon` WHERE `guid` IN (266611,266640,266626,266632,266635,266636,266637,266563,266629);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(266611,0,0,0,1,0, '88637'),(266640,0,0,0,1,0, '88637'),(266636,0,0,0,1,0, '88638'),(266632,0,0,0,1,0, '88640'),(266635,0,0,0,1,0, '88641'),
(266626,0,0,0,1,0, '88642'),(266637,0,0,0,1,0, '88643'),(266563,0,0,0,1,0, '88643'),(266629,0,0,0,1,0, '88644');

-- Pathing for Myzerian Entry: 48374 'TDB FORMAT' 
SET @NPC := 264436;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9066.39,`position_y`=-52.7726,`position_z`=141.1734 WHERE `guid`=@NPC;
UPDATE `creature_template_addon` SET `path_id`=@PATH WHERE `entry`=48374;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9066.39,-52.7726,141.1734,0,0,0,0,100,0),
(@PATH,2,-9053.15,-74.2292,141.1734,0,0,0,0,100,0),
(@PATH,3,-9029.39,-85.816,141.1734,0,0,0,0,100,0),
(@PATH,4,-8996.35,-85.2882,141.4205,0,0,0,0,100,0),
(@PATH,5,-8978.31,-78.4809,141.1705,0,0,0,0,100,0),
(@PATH,6,-8949.28,-51.2101,141.1705,0,0,0,0,100,0),
(@PATH,7,-8930.81,-34.2951,141.1708,0,0,0,0,100,0),
(@PATH,8,-8915,-15.724,141.1724,0,0,0,0,100,0),
(@PATH,9,-8912.97,-13.4201,141.1724,0,0,0,0,100,0),
(@PATH,10,-8917.75,-19.2118,141.1724,0,0,0,0,100,0),
(@PATH,11,-8934.45,-40.3802,141.1705,0,0,0,0,100,0),
(@PATH,12,-8951.17,-60.0781,141.1705,0,0,0,0,100,0),
(@PATH,13,-8969.64,-74.2014,141.1705,0,0,0,0,100,0),
(@PATH,14,-8987.17,-80.1198,141.1705,0,0,0,0,100,0),
(@PATH,15,-9017.69,-83.6927,141.1734,0,0,0,0,100,0),
(@PATH,16,-9044.73,-80.1198,141.1734,0,0,0,0,100,0),
(@PATH,17,-9061.14,-62.6094,141.1734,0,0,0,0,100,0),
(@PATH,18,-9069.6,-34.3455,141.1734,0,0,0,0,100,0),
(@PATH,19,-9067.51,-7.59028,141.1734,0,0,0,0,100,0),
(@PATH,20,-9057.23,18.7951,141.1734,0,0,0,0,100,0),
(@PATH,21,-9043.51,42.7899,141.1299,0,0,0,0,100,0),
(@PATH,22,-9019.85,65.809,141.1734,0,0,0,0,100,0),
(@PATH,23,-9029.39,59.2361,141.1734,0,0,0,0,100,0),
(@PATH,24,-9044.41,40.0451,141.1299,0,0,0,0,100,0),
(@PATH,25,-9058.99,9.78646,141.1734,0,0,0,0,100,0),
(@PATH,26,-9070.3,-21.6597,141.1734,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47291 'TDB FORMAT' 
SET @NPC := 266545;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10742.4,`position_y`=888.491,`position_z`=16.68042 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10742.4,888.491,16.68042,0,0,0,0,100,0),
(@PATH,2,-10727,885.781,16.36264,0,0,0,0,100,0),
(@PATH,3,-10723.9,870.375,10.11142,0,0,0,0,100,0),
(@PATH,4,-10722.3,848.833,2.988626,0,0,0,0,100,0),
(@PATH,5,-10730.7,830.248,0.6880438,0,0,0,0,100,0),
(@PATH,6,-10722.3,848.833,2.988626,0,0,0,0,100,0),
(@PATH,7,-10723.9,870.375,10.11142,0,0,0,0,100,0),
(@PATH,8,-10727,885.781,16.36264,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 266329;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10439.6,`position_y`=1152.14,`position_z`=55.6641 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10439.6,1152.14,55.6641,0,0,0,0,100,0),
(@PATH,2,-10437.5,1155.74,56.73246,0,0,0,0,100,0),
(@PATH,3,-10436.8,1159.21,57.33964,0,0,0,0,100,0),
(@PATH,4,-10435.6,1162.64,58.18327,0,0,0,0,100,0),
(@PATH,5,-10437,1166.55,58.5745,0,0,0,0,100,0),
(@PATH,6,-10438.5,1170.07,58.71746,0,0,0,0,100,0),
(@PATH,7,-10441.1,1173.35,59.06781,0,0,0,0,100,0),
(@PATH,8,-10444.2,1176.43,59.06781,0,0,0,0,100,0),
(@PATH,9,-10446.9,1178.58,58.88617,0,0,0,0,100,0),
(@PATH,10,-10450.3,1180.94,58.03668,0,0,0,0,100,0),
(@PATH,11,-10452.9,1181.8,57.35467,0,0,0,0,100,0),
(@PATH,12,-10455.8,1182.63,56.66961,0,0,0,0,100,0),
(@PATH,13,-10452.9,1181.8,57.35467,0,0,0,0,100,0),
(@PATH,14,-10450.3,1180.94,58.03668,0,0,0,0,100,0),
(@PATH,15,-10446.9,1178.58,58.88617,0,0,0,0,100,0),
(@PATH,16,-10444.2,1176.43,59.06781,0,0,0,0,100,0),
(@PATH,17,-10441.1,1173.35,59.06781,0,0,0,0,100,0),
(@PATH,18,-10438.5,1170.07,58.71746,0,0,0,0,100,0),
(@PATH,19,-10437,1166.55,58.5745,0,0,0,0,100,0),
(@PATH,20,-10435.6,1162.64,58.18327,0,0,0,0,100,0),
(@PATH,21,-10436.8,1159.21,57.33964,0,0,0,0,100,0),
(@PATH,22,-10437.5,1155.74,56.73246,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 266341;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10512.6,`position_y`=1000.55,`position_z`=43.22828 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10512.6,1000.55,43.22828,0,0,0,0,100,0),
(@PATH,2,-10527,1003.19,42.97486,0,0,0,0,100,0),
(@PATH,3,-10549.2,1002.18,41.2632,0,0,0,0,100,0),
(@PATH,4,-10570.4,996.976,38.84095,0,0,0,0,100,0),
(@PATH,5,-10549.2,1002.18,41.2632,0,0,0,0,100,0),
(@PATH,6,-10527,1003.19,42.97486,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 266642;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10514.3,`position_y`=1305.84,`position_z`=63.59494 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10514.3,1305.84,63.59494,0,0,0,0,100,0),
(@PATH,2,-10512.4,1302.32,63.8005,0,0,0,0,100,0),
(@PATH,3,-10508.8,1298.02,64.26659,0,0,0,0,100,0),
(@PATH,4,-10506.1,1294.49,64.44091,0,0,0,0,100,0),
(@PATH,5,-10502.8,1289.3,65.27966,0,0,0,0,100,0),
(@PATH,6,-10500.2,1284.32,65.95507,0,0,0,0,100,0),
(@PATH,7,-10496.7,1280.49,65.74802,0,0,0,0,100,0),
(@PATH,8,-10500.2,1284.32,65.95507,0,0,0,0,100,0),
(@PATH,9,-10502.8,1289.3,65.27966,0,0,0,0,100,0),
(@PATH,10,-10506.1,1294.49,64.44091,0,0,0,0,100,0),
(@PATH,11,-10508.8,1298.02,64.26659,0,0,0,0,100,0),
(@PATH,12,-10512.4,1302.32,63.8005,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 266313;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10478,`position_y`=974.563,`position_z`=42.0183 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10478,974.563,42.0183,0,0,0,0,100,0),
(@PATH,2,-10477.8,956.802,41.9409,0,0,0,0,100,0),
(@PATH,3,-10478,974.563,42.0183,0,0,0,0,100,0),
(@PATH,4,-10490.9,989.656,42.61961,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 266330;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10557.2,`position_y`=1142.97,`position_z`=34.87698 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10557.2,1142.97,34.87698,0,0,0,0,100,0),
(@PATH,2,-10557.8,1148.17,34.96328,0,0,0,0,100,0),
(@PATH,3,-10559.1,1151.83,34.77578,0,0,0,0,100,0),
(@PATH,4,-10560.4,1157.37,34.27431,0,0,0,0,100,0),
(@PATH,5,-10563.2,1161.22,33.4164,0,0,0,0,100,0),
(@PATH,6,-10565.2,1166.57,32.38552,0,0,0,0,100,0),
(@PATH,7,-10567.8,1170.83,31.70522,0,0,0,0,100,0),
(@PATH,8,-10565.2,1166.57,32.38552,0,0,0,0,100,0),
(@PATH,9,-10563.2,1161.22,33.4164,0,0,0,0,100,0),
(@PATH,10,-10560.4,1157.37,34.27431,0,0,0,0,100,0),
(@PATH,11,-10559.1,1151.83,34.77578,0,0,0,0,100,0),
(@PATH,12,-10557.8,1148.17,34.96328,0,0,0,0,100,0),
(@PATH,13,-10557.2,1142.97,34.87698,0,0,0,0,100,0),
(@PATH,14,-10557.8,1135.69,34.18179,0,0,0,0,100,0),
(@PATH,15,-10561.9,1131.307,33.0752,0,0,0,0,100,0),
(@PATH,16,-10567.9,1129.29,32.25073,0,0,0,0,100,0),
(@PATH,17,-10561.9,1131.3,33.14368,0,0,0,0,100,0),
(@PATH,18,-10557.8,1135.683,34.20986,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 266333;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10592.2,`position_y`=1119.23,`position_z`=30.25427 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10592.2,1119.23,30.25427,0,0,0,0,100,0),
(@PATH,2,-10597.5,1121.32,30.25513,0,0,0,0,100,0),
(@PATH,3,-10601.5,1125.25,30.17081,0,0,0,0,100,0),
(@PATH,4,-10606,1129.28,29.67984,0,0,0,0,100,0),
(@PATH,5,-10609.1,1132,28.98148,0,0,0,0,100,0),
(@PATH,6,-10612.4,1135.15,28.10674,0,0,0,0,100,0),
(@PATH,7,-10609.1,1132,28.98148,0,0,0,0,100,0),
(@PATH,8,-10606,1129.28,29.67984,0,0,0,0,100,0),
(@PATH,9,-10601.5,1125.25,30.17081,0,0,0,0,100,0),
(@PATH,10,-10597.5,1121.32,30.25513,0,0,0,0,100,0),
(@PATH,11,-10592.2,1119.23,30.25427,0,0,0,0,100,0),
(@PATH,12,-10584.7,1118.94,30.46936,0,0,0,0,100,0);

-- Pathing for Schnottz's Landing Laborer Entry: 47690 'TDB FORMAT' 
SET @NPC := 264000;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10383.3,`position_y`=1074.79,`position_z`=64.9967 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10383.3,1074.79,64.9967,0,0,0,0,100,0),
(@PATH,2,-10387.1,1077.4,63.45007,0,0,0,0,100,0),
(@PATH,3,-10383.3,1074.79,64.9967,0,0,0,0,100,0),
(@PATH,4,-10380.1,1073.14,65.50549,0,0,0,0,100,0),
(@PATH,5,-10377,1070.57,66.25256,0,0,0,0,100,0),
(@PATH,6,-10373.9,1066.66,67.04495,0,0,0,0,100,0),
(@PATH,7,-10370.8,1063.3,67.29495,0,0,0,0,100,0),
(@PATH,8,-10366.6,1061.83,67.80446,0,0,0,0,100,0),
(@PATH,9,-10357.7,1064.41,67.06459,0,0,0,0,100,0),
(@PATH,10,-10366.6,1061.83,67.80446,0,0,0,0,100,0),
(@PATH,11,-10370.8,1063.3,67.29495,0,0,0,0,100,0),
(@PATH,12,-10373.9,1066.66,67.04495,0,0,0,0,100,0),
(@PATH,13,-10377,1070.57,66.25256,0,0,0,0,100,0),
(@PATH,14,-10380.1,1073.14,65.50549,0,0,0,0,100,0);

-- Pathing for Prolific Writer Entry: 47461 'TDB FORMAT' 
SET @NPC := 266584;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10657.2,`position_y`=1033.57,`position_z`=23.88646 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10657.2,1033.57,23.88646,0,0,0,0,100,0),
(@PATH,2,-10662.1,1042.65,23.81322,0,0,0,0,100,0),
(@PATH,3,-10663.4,1045.27,23.76757,0,3000,0,0,100,0),
(@PATH,4,-10659.5,1035.31,23.73558,0,0,0,0,100,0),
(@PATH,5,-10653.3,1023.72,24.29646,0,3000,0,0,100,0);

-- Pathing for Prolific Writer Entry: 47461 'TDB FORMAT' 
SET @NPC := 266606;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-10678.8,`position_y`=1085.44,`position_z`=25.28742 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-10678.8,1085.44,25.28742,0,0,0,0,100,0),
(@PATH,2,-10677.44,1085.391,25.23227,0,2000,0,0,100,0),
(@PATH,3,-10683.1,1085.79,25.46173,0,0,0,0,100,0),
(@PATH,4,-10689.4,1086.16,25.61678,0,2000,0,0,100,0),
(@PATH,5,-10684.5,1085.7,25.51879,0,0,0,0,100,0),
(@PATH,6,-10678.8,1085.44,25.28742,0,0,0,0,100,0);
