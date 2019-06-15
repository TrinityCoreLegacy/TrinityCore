-- 
UPDATE `gossip_menu_option` SET `OptionIcon`=2, `OptionType`=4, `OptionNpcFlag`=8192 WHERE `MenuID` IN (13047,13045);
DELETE FROM `gossip_menu` WHERE (`MenuId`=15086 AND `TextId`=21408) OR (`MenuId`=14163 AND `TextId`=13845) OR (`MenuId`=9873 AND `TextId`=27896) OR (`MenuId`=15134 AND `TextId`=12909) OR (`MenuId`=15135 AND `TextId`=11291) OR (`MenuId`=21161 AND `TextId`=12976) OR (`MenuId`=20913 AND `TextId`=31474) OR (`MenuId`=13046 AND `TextId`=18321);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
(15086, 21408, 26365), -- 29529 (Ninsianna)
(14163, 13845, 26365), -- 28956 (Warcaster Fanoraithe)
(9873, 27896, 26365), -- 28701 (Timothy Jones)
(15134, 12909, 26365), -- 26377 (Squire Percy)
(15135, 11291, 26365), -- 23733 (Horatio the Stable Boy)
(21161, 12976, 26365), -- 27856 (Chromie)
(20913, 31474, 26365), -- 27938 (Trizormu)
(13046, 18321, 26365); -- 26879 (Tomas Riverwell)
