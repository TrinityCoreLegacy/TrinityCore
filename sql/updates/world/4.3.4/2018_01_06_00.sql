delete from `quest_template_addon` WHERE `ID` IN (26150, 46);
insert into `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) values
('26150','0','0','0','60','0','0','0','0','0','0','0','0','0','0','0','0'),
('46','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');