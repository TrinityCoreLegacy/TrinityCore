-- Lesser Cache of the Aspects

-- Set Reference loots
SET @CHESTNORMAL := 50046;
SET @CHESTHEROIC := 50047;
SET @CHESTRAIDFINDER := 50048;
SET @LESSERCACHENORMAL := 50049;
SET @LESSERCACHEHEROIC := 50050;
SET @LESSERCACHERAIDFINDER := 50051;

-- Set Gold
UPDATE `gameobject_template_addon` SET `faction`=0, `flags`=0, `mingold`=220000, `maxgold`=280000 WHERE `entry` IN (210160,210162,210221);
UPDATE `gameobject_template_addon` SET `faction`=0, `flags`=0, `mingold`=1200000, `maxgold`=1360000 WHERE `entry` IN (210161,210163);

-- Lesser Cache of the Aspects - Dragon Soul - Normal 10 Man Entry: 210160
SET @ENTRY := 41204;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77952,0,100,1,1,1,1,3, 'Elementium Gem Cluster (Quest Item)'),
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,78919,0,0.5,0,1,1,1,1, 'Experiment 12-B (Lesser Cache of the Aspects)'),
(@ENTRY,1,@CHESTNORMAL,100,0,1,1,1,1, 'Chest of the Corrupted Loot (Lesser Cache of the Aspects - Normal)'),
(@ENTRY,2,@LESSERCACHENORMAL,100,0,1,1,1,1, 'Random Loot (Lesser Cache of the Aspects - Normal)');

-- Lesser Cache of the Aspects - Dragon Soul - Normal 25 Man Entry: 210161
SET @ENTRY := 41156;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77952,0,100,1,1,1,1,3, 'Elementium Gem Cluster (Quest Item)'),
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,78919,0,1.2,0,1,2,1,1, 'Experiment 12-B (Lesser Cache of the Aspects)'),
(@ENTRY,1,@CHESTNORMAL,100,0,1,1,2,2, 'Chest of the Corrupted Loot (Lesser Cache of the Aspects - Normal)'),
(@ENTRY,2,@LESSERCACHENORMAL,100,0,1,1,4,4, 'Random Loot (Lesser Cache of the Aspects - Normal)');

-- Lesser Cache of the Aspects - Dragon Soul - Heroic 10 Man Entry: 210162
SET @ENTRY := 41191;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,78919,0,0.5,0,1,1,1,1, 'Experiment 12-B (Lesser Cache of the Aspects)'),
(@ENTRY,1,@CHESTHEROIC,100,0,1,1,1,1, 'Chest of the Corrupted Loot (Lesser Cache of the Aspects - Heroic)'),
(@ENTRY,2,@LESSERCACHEHEROIC,100,0,1,1,1,1, 'Random Loot (Lesser Cache of the Aspects - Heroic)');

-- Lesser Cache of the Aspects - Dragon Soul - Heroic 25 Man Entry: 210163
SET @ENTRY := 41171;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,78919,0,1.2,0,1,2,1,1, 'Experiment 12-B (Lesser Cache of the Aspects)'),
(@ENTRY,1,@CHESTHEROIC,100,0,1,1,2,2, 'Chest of the Corrupted Loot (Lesser Cache of the Aspects - Heroic)'),
(@ENTRY,2,@LESSERCACHEHEROIC,100,0,1,1,4,4, 'Random Loot (Lesser Cache of the Aspects - Heroic)');

-- Lesser Cache of the Aspects - Dragon Soul - Raid Finder 25 Man Entry: 210221
SET @ENTRY := 41183;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,1,@CHESTRAIDFINDER,100,0,1,1,2,2, 'Chest of the Corrupted Loot (Lesser Cache of the Aspects - Raid Finder)'),
(@ENTRY,2,@LESSERCACHERAIDFINDER,100,0,1,1,4,4, 'Random Loot (Lesser Cache of the Aspects - Raid Finder)');

-- Lesser Cache of the Aspects Normal Loot
SET @ENTRY := @CHESTNORMAL;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,78174,0,0,0,1,1,1,1, 'Chest of the Corrupted Vanquisher (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,78179,0,0,0,1,1,1,1, 'Chest of the Corrupted Protector (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,78184,0,0,0,1,1,1,1, 'Chest of the Corrupted Conqueror (Lesser Cache of the Aspects - Dragon Soul - Normal)');

-- Lesser Cache of the Aspects Normal Loot
SET @ENTRY := @CHESTHEROIC;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,78847,0,0,0,1,1,1,1, 'Chest of the Corrupted Conqueror (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78848,0,0,0,1,1,1,1, 'Chest of the Corrupted Protector (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78849,0,0,0,1,1,1,1, 'Chest of the Corrupted Vanquisher (Lesser Cache of the Aspects - Dragon Soul - Heroic)');

-- Lesser Cache of the Aspects Normal Loot
SET @ENTRY := @CHESTRAIDFINDER;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,78863,0,0,0,1,1,1,1, 'Chest of the Corrupted Conqueror (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78864,0,0,0,1,1,1,1, 'Chest of the Corrupted Protector (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78862,0,0,0,1,1,1,1, 'Chest of the Corrupted Vanquisher (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)');

-- Lesser Cache of the Aspects Normal Loot
SET @ENTRY := @LESSERCACHENORMAL;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77245,0,0,0,1,1,1,1, 'Ledger of Revolting Rituals (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77205,0,0,0,1,1,1,1, 'Creche of the Final Dragon (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,78013,0,0,0,1,1,1,1, 'Curled Twilight Claw (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77244,0,0,0,1,1,1,1, 'Dragonfracture Belt (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77242,0,0,0,1,1,1,1, 'Imperfect Specimens 27 and 28 (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77243,0,0,0,1,1,1,1, 'Treads of Sordid Screams (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77247,0,0,0,1,1,1,1, 'Bracers of Looming Darkness (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77223,0,0,0,1,1,1,1, 'Morningstar of Heroic Will (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77246,0,0,0,1,1,1,1, 'Stillheart Warboots (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77210,0,0,0,1,1,1,1, 'Bone-Link Fetish (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77208,0,0,0,1,1,1,1, 'Cunning of the Cruel (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77232,0,0,0,1,1,1,1, 'Hardheart Ring (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77211,0,0,0,1,1,1,1, 'Indomitable Pride (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77228,0,0,0,1,1,1,1, 'Infinite Loop (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77231,0,0,0,1,1,1,1, 'Seal of Primordial Shadow (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77207,0,0,0,1,1,1,1, 'Vial of Shadows (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77229,0,0,0,1,1,1,1, 'Signet of Suturing (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77230,0,0,0,1,1,1,1, 'Breathstealer Band (Lesser Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77209,0,0,0,1,1,1,1, 'Windward Heart (Lesser Cache of the Aspects - Dragon Soul - Normal)');

-- Lesser Cache of the Aspects Heroic Loot
SET @ENTRY := @LESSERCACHEHEROIC;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,78433,0,0,0,1,1,1,1, 'Ledger of Revolting Rituals (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,77992,0,0,0,1,1,1,1, 'Creche of the Final Dragon (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78432,0,0,0,1,1,1,1, 'Curled Twilight Claw (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78436,0,0,0,1,1,1,1, 'Dragonfracture Belt (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78435,0,0,0,1,1,1,1, 'Imperfect Specimens 27 and 28 (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78434,0,0,0,1,1,1,1, 'Treads of Sordid Screams (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78430,0,0,0,1,1,1,1, 'Bracers of Looming Darkness (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78429,0,0,0,1,1,1,1, 'Morningstar of Heroic Will (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78431,0,0,0,1,1,1,1, 'Stillheart Warboots (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78002,0,0,0,1,1,1,1, 'Bone-Link Fetish (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78000,0,0,0,1,1,1,1, 'Cunning of the Cruel (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78493,0,0,0,1,1,1,1, 'Hardheart Ring (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78003,0,0,0,1,1,1,1, 'Indomitable Pride (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78490,0,0,0,1,1,1,1, 'Infinite Loop (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78489,0,0,0,1,1,1,1, 'Seal of Primordial Shadow (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,77999,0,0,0,1,1,1,1, 'Vial of Shadows (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78491,0,0,0,1,1,1,1, 'Signet of Suturing (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78492,0,0,0,1,1,1,1, 'Breathstealer Band (Lesser Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78001,0,0,0,1,1,1,1, 'Windward Heart (Lesser Cache of the Aspects - Dragon Soul - Heroic)');

-- Lesser Cache of the Aspects Raid Finder Loot
SET @ENTRY := @LESSERCACHERAIDFINDER;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,78441,0,0,0,1,1,1,1, 'Ledger of Revolting Rituals (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77972,0,0,0,1,1,1,1, 'Creche of the Final Dragon (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78440,0,0,0,1,1,1,1, 'Curled Twilight Claw (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78444,0,0,0,1,1,1,1, 'Dragonfracture Belt (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78443,0,0,0,1,1,1,1, 'Imperfect Specimens 27 and 28 (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78442,0,0,0,1,1,1,1, 'Treads of Sordid Screams (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78438,0,0,0,1,1,1,1, 'Bracers of Looming Darkness (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78437,0,0,0,1,1,1,1, 'Morningstar of Heroic Will (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78439,0,0,0,1,1,1,1, 'Stillheart Warboots (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77982,0,0,0,1,1,1,1, 'Bone-Link Fetish (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77980,0,0,0,1,1,1,1, 'Cunning of the Cruel (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78498,0,0,0,1,1,1,1, 'Hardheart Ring (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77983,0,0,0,1,1,1,1, 'Indomitable Pride (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78495,0,0,0,1,1,1,1, 'Infinite Loop (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78494,0,0,0,1,1,1,1, 'Seal of Primordial Shadow (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77979,0,0,0,1,1,1,1, 'Vial of Shadows (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78496,0,0,0,1,1,1,1, 'Signet of Suturing (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78497,0,0,0,1,1,1,1, 'Breathstealer Band (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77981,0,0,0,1,1,1,1, 'Windward Heart (Lesser Cache of the Aspects - Dragon Soul - Raid Finder)');

-- Greater Cache of the Aspects

-- Set Reference loots
SET @GREATERCACHENORMAL := 50052;
SET @GREATERCACHEHEROIC := 50053;
SET @GREATERCACHERAIDFINDER := 50054;

-- Set Gold
UPDATE `gameobject_template_addon` SET `faction`=0, `flags`=0, `mingold`=220000, `maxgold`=280000 WHERE `entry` IN (209894,209895,210222);
UPDATE `gameobject_template_addon` SET `faction`=0, `flags`=0, `mingold`=1200000, `maxgold`=1360000 WHERE `entry` IN (209896,209897);

-- Greater Cache of the Aspects - Dragon Soul - Normal 10 Man Entry: 209894
SET @ENTRY := 41206;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77952,0,100,1,1,1,1,3, 'Elementium Gem Cluster (Quest Item)'),
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,1,@GREATERCACHENORMAL,100,0,1,1,2,2, 'Random Loot (Greater Cache of the Aspects - Normal)');	

-- Greater Cache of the Aspects - Dragon Soul - Normal 25 Man Entry: 209895
SET @ENTRY := 41159;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77952,0,100,1,1,1,1,3, 'Elementium Gem Cluster (Quest Item)'),
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,1,@GREATERCACHENORMAL,100,0,1,1,6,6, 'Random Loot (Greater Cache of the Aspects - Normal)');

-- Greater Cache of the Aspects - Dragon Soul - Heroic 10 Man Entry: 209896
SET @ENTRY := 41193;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,1,@GREATERCACHEHEROIC,100,0,1,1,2,2, 'Random Loot (Greater Cache of the Aspects - Heroic)');	

-- Greater Cache of the Aspects - Dragon Soul - Heroic 25 Man Entry: 209897
SET @ENTRY := 41176;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,71998,0,100,0,1,1,1,3, 'Essence of Destruction'),
(@ENTRY,1,@GREATERCACHEHEROIC,100,0,1,1,6,6, 'Random Loot (Greater Cache of the Aspects - Heroic)');

-- Greater Cache of the Aspects - Dragon Soul - Raid Finder 25 Man Entry: 210222
SET @ENTRY := 41185;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,1,@GREATERCACHERAIDFINDER,100,0,1,1,6,6, 'Random Loot (Greater Cache of the Aspects - Raid Finder)');

-- Greater Cache of the Aspects Normal Loot
SET @ENTRY := @GREATERCACHENORMAL;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77197,0,0,0,1,1,1,1, 'Wrath of Unchaining (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77198,0,0,0,1,1,1,1, 'Will of Unbinding (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77199,0,0,0,1,1,1,1, 'Heart of Unliving (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77200,0,0,0,1,1,1,1, 'Eye of Unmaking (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77201,0,0,0,1,1,1,1, 'Resolve of Undying (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77235,0,0,0,1,1,1,1, 'Gauntlets of the Golden Thorn (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77236,0,0,0,1,1,1,1, 'Backbreaker Spaulders (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77237,0,0,0,1,1,1,1, 'Belt of Shattered Elementium (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,77238,0,0,0,1,1,1,1, 'Molten Blood Footpads (Greater Cache of the Aspects - Dragon Soul - Normal)'),
(@ENTRY,78357,0,0,0,1,1,1,1, 'Gloves of Liquid Smoke (Greater Cache of the Aspects - Dragon Soul - Normal)');

-- Greater Cache of the Aspects Heroic Loot
SET @ENTRY := @GREATERCACHEHEROIC;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77994,0,0,0,1,1,1,1, 'Wrath of Unchaining (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,77995,0,0,0,1,1,1,1, 'Will of Unbinding (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,77996,0,0,0,1,1,1,1, 'Heart of Unliving (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,77997,0,0,0,1,1,1,1, 'Eye of Unmaking (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,77998,0,0,0,1,1,1,1, 'Resolve of Undying (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78464,0,0,0,1,1,1,1, 'Gauntlets of the Golden Thorn (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78465,0,0,0,1,1,1,1, 'Backbreaker Spaulders (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78463,0,0,0,1,1,1,1, 'Belt of Shattered Elementium (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78462,0,0,0,1,1,1,1, 'Molten Blood Footpads (Greater Cache of the Aspects - Dragon Soul - Heroic)'),
(@ENTRY,78461,0,0,0,1,1,1,1, 'Gloves of Liquid Smoke (Greater Cache of the Aspects - Dragon Soul - Heroic)');

-- Greater Cache of the Aspects Raid Finder Loot
SET @ENTRY := @GREATERCACHERAIDFINDER;
DELETE FROM `reference_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `reference_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,77974,0,0,0,1,1,1,1, 'Wrath of Unchaining (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77975,0,0,0,1,1,1,1, 'Will of Unbinding (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77976,0,0,0,1,1,1,1, 'Heart of Unliving (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77977,0,0,0,1,1,1,1, 'Eye of Unmaking (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,77978,0,0,0,1,1,1,1, 'Resolve of Undying (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78469,0,0,0,1,1,1,1, 'Gauntlets of the Golden Thorn (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78470,0,0,0,1,1,1,1, 'Backbreaker Spaulders (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78468,0,0,0,1,1,1,1, 'Belt of Shattered Elementium (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78467,0,0,0,1,1,1,1, 'Molten Blood Footpads (Greater Cache of the Aspects - Dragon Soul - Raid Finder)'),
(@ENTRY,78466,0,0,0,1,1,1,1, 'Gloves of Liquid Smoke (Greater Cache of the Aspects - Dragon Soul - Raid Finder)');
