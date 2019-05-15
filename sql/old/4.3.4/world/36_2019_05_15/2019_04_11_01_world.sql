-- temp data while we can find proper data
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (22831,22832,22833,15175,2216,5504,4984,13962,14460,17461,17969,18015,20260,20403,22034);
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (19059,22351,20531,23325,23379,23415,23638,24223,24610,26105,26106,26107,26691,26692);
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (3627,23153,16572,27772,28236,55,35538);
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(22831,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(22832,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(22833,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(15175,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(2216,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(5504,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(4984,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(13962,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(14460,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(17461,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(17969,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(18015,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(20260,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(20403,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(22034,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(19059,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(22351,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(20531,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(23325,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(23379,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(23415,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(23638,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(24223,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(24610,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(26105,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(26106,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(26107,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(26691,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(26692,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(3627,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(23153,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(16572,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(27772,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(28236,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(55,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(35538,2589,0,100,0,1,1,1,1, 'Linen Cloth');

DELETE FROM `spell_loot_template` WHERE `Entry` IN (87628,88343,102923);
INSERT INTO `spell_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(87628,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(88343,2589,0,100,0,1,1,1,1, 'Linen Cloth'),
(102923,2589,0,100,0,1,1,1,1, 'Linen Cloth');
