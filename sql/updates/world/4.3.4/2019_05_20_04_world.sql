DELETE FROM `gossip_menu` WHERE (`MenuId`=15086 AND `TextId`=21408) OR (`MenuId`=20913 AND `TextId`=31474);
DELETE FROM `npc_text` WHERE `ID` IN (27896);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`) VALUES
(27896,"I'm very sorry, but I no longer have relics to sell you. Their magic seems to have extinguished! Perhaps I'll go into dancing full time now, it would be a nice change of pace.","",68132,0,1,0,0,0,0,0,0);
