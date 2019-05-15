-- Fengus's Chest
SET @ENTRY := 16523;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,18268,0,100,1,1,1,1,1, 'Gordok Inner Door Key');

-- Horn of Elemental Fury
SET @ENTRY := 25714;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,42894,0,100,0,1,1,1,1, 'Horn of Elemental Fury');

-- Arena Spoils
SET @ENTRY := 17918;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,22317,0,32,0,1,1,1,1, 'Lefty''s Brass Knuckle'),
(@ENTRY,22318,0,32,0,1,1,1,1, 'Malgen''s Long Bow'),
(@ENTRY,22330,0,32,0,1,1,1,1, 'Shroud of Arcane Mastery'),
(@ENTRY,22305,0,4,0,1,1,1,1, 'Ironweave Mantle');

-- Small Termite Mound
SET @ENTRY := 15797;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,15043,0,100,1,1,0,1,5, 'Plagueland Termites');

-- Divino-Matic Rod
SET @ENTRY := 5629;
DELETE FROM `gameobject_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(@ENTRY,8548,0,100,1,1,0,1,1, 'Divino-Matic Rod');

UPDATE `spell_proc` SET `SpellId` = 16689 WHERE `SpellId` = -16689;

DELETE FROM `spell_proc` WHERE `SpellId` = -588;

