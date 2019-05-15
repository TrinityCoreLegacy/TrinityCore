--
DELETE FROM `npc_text` WHERE `ID` IN (18029, 18030, 18031, 18144, 18155, 18158, 18165, 18242, 18262, 18263, 18264, 18265, 18266, 21296, 21298);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(18029, 'Missing npc_text'),
(18030, 'Missing npc_text'),
(18031, 'Missing npc_text'),
(18144, 'Missing npc_text'),
(18155, 'Missing npc_text'),
(18158, 'Missing npc_text'),
(18165, 'Missing npc_text'),
(18242, 'Missing npc_text'),
(18262, 'Missing npc_text'),
(18263, 'Missing npc_text'),
(18264, 'Missing npc_text'),
(18265, 'Missing npc_text'),
(18266, 'Missing npc_text'),
(21296, 'Missing npc_text'),
(21298, 'Missing npc_text');

-- Fishing Schools
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (25666,25667,25672,28565,35544);
INSERT INTO `gameobject_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(25666,41808,0,100,0,1,1,1,1, 'Bonescale Snapper'),
(25667,41803,0,100,0,1,1,1,1, 'Rockfin Grouper'),
(25672,41812,0,100,0,1,1,1,1, 'Barrelhead Goby'),
(28565,53071,0,100,0,1,1,1,1, 'Algaefin Rockfish'),
(35544,6291,0,100,0,1,1,1,1, 'Raw Brilliant Smallfish');
