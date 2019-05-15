--
DELETE FROM `spell_dbc` WHERE `Id`= 93716;
INSERT INTO `spell_dbc` (`Id`, `CastingTimeIndex`, `DurationIndex`, `Comment`) VALUES
(93716, 0, 27, 'Shield of the Perfidious');

DELETE FROM `spelleffect_dbc` WHERE `Id`= 155915;
INSERT INTO `spelleffect_dbc` (`Id`, `Effect`, `EffectMiscValue`, `EffectMiscValueB`, `EffectRadiusIndex`, `EffectRadiusIndexMax`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectSpellId`, `EffectIndex`, `Comment`) VALUES
(155915, 28, 50547, 64, 7,7, 18, 18, 93716, 0, '');

DELETE FROM `spell_dbc` WHERE `Id`= 59632;
INSERT INTO `spell_dbc` (`Id`, `DurationIndex`, `Comment`) VALUES
(59632, 21, "Serverside Spell: mod scale 0.1");

DELETE FROM `spelleffect_dbc` WHERE `Id`= 160080;
INSERT INTO `spelleffect_dbc` (`Id`, `EffectSpellId`, `Effect`, `EffectApplyAuraName`, `EffectBasePoints`, `EffectIndex`, `Comment`) VALUES
(160080, 59632, 6, 61, -90, 0, '');

DELETE FROM `spell_proc` WHERE `SpellID`= -53234;
INSERT INTO `spell_proc` (`SpellID`, `SpellFamilyName`, `SpellFamilyMask0`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`) VALUES
(-53234, 9, 0, 0, 1, 2, 2);

DELETE FROM `spell_proc` WHERE `SpellID` IN (-34485, 82926);
INSERT INTO `spell_proc` (`SpellID`, `SpellFamilyName`, `SpellFamilyMask0`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`) VALUES
(-34485, 9, 0, 0, 1, 1, 0),
(82926, 9, 0, 0, 1, 1, 0);

DELETE FROM `spell_proc` WHERE `SpellID`= -35104;
INSERT INTO `spell_proc` (`SpellID`, `SpellFamilyName`, `SpellFamilyMask0`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`) VALUES
(-35104, 9, 0, 0, 1, 2, 2);

DELETE FROM `spell_proc` WHERE `SpellId`= -48965;
INSERT INTO `spell_proc` (`SpellID`, `SchoolMask`, `SpellFamilyName`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`) VALUES
(-48965, 32, 15, 0x00010000 | 0x00004000, 7, 1, 12287);

DELETE FROM `spell_proc` WHERE `SpellID`= 79577;
INSERT INTO `spell_proc` (`SpellID`, `SpellFamilyName`, `SpellFamilyMask0`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`) VALUES
(79577, 0, 0, 0x00010000, 1, 1);

-- druid's natures grace should have a 60 seconds cooldown and should proc on cast, not on hit
UPDATE `spell_proc` SET `SpellPhaseMask`= 1, `Cooldown`= 60000, `HitMask`= 12287 WHERE `SpellId`= -16880;

-- Proc Entries
DELETE FROM `spell_proc` WHERE `SpellId` IN (74981, 90738, 74976, 90737, 90759);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `Cooldown`) VALUES
(74981, 0x00000004, 1, 0, 8400),
(90738, 0x00000004, 1, 0, 8400),
(90759, 0x00000004, 1, 0, 2000);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`) VALUES
(74976, 1|2|4|8|16|32|64, 0x00015510, 7, 1, 0),
(90737, 1|2|4|8|16|32|64, 0x00015510, 7, 1, 0);

-- Spells
DELETE FROM `spell_proc` WHERE `SpellId` IN (87900, 87897);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `Cooldown`) VALUES
(87900, 0x00000004, 1, 0, 4000),
(87897, 0x00000004, 1, 0, 4000);

DELETE FROM `spell_proc` WHERE `SpellID` IN (44445, -44446);
INSERT INTO `spell_proc` (`SpellID`, `SpellFamilyName`, `SpellFamilyMask0`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(44445, 3, 0, 0x00010000, 1, 2, 2, 0x0000020),
(-44446, 3, 0, 0x00010000, 1, 2, 0, 0x0000020);

DELETE FROM `spell_proc` WHERE `SpellId`= 28176;
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(28176, 0x00050000, 0x00000001, 0x00000002, 0, 0x0000010 | 0x0000040);

DELETE FROM `spell_proc` WHERE `SpellId` IN (-16180, 16188, -16176, -82984);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(-16180, 0x00004000, 0x00000002, 0x00000002, 0x00000002, 0),
(-16176, 0x00055550, 0x00000002, 0x00000002, 0x00000002, 0),
(-82984, 0x00010000, 0x00000001, 0x00000002, 0x00000000, 0);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(16188, 8, 0x00015550, 0x00000001|0x00000002, 0x00000001, 0, 0);

UPDATE `spell_proc` SET `SpellFamilyMask0`= 0x00000020, `ProcFlags`= 0x00040000, `SpellTypeMask`= 1, `SpellPhaseMask`= 2, `Cooldown`= 5000 WHERE `SpellId`= -56636;

DELETE FROM `spell_proc` WHERE `SpellId`= 52007;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Chance`) VALUES
(52007, 11, 0x00004400, 0x00000002, 0x00000002, 0, 20);

DELETE FROM `spell_proc` WHERE `SpellId` IN (
90848, -- Item - Proc Spell Power
90886, -- Item - Proc Haste Rating
90888, -- Item - Proc Haste Rating
90892, -- Item - Proc Crit Rating
90897, -- Item - Proc Spell Power
90899, -- Item - Proc Spell Power
90990, -- Item - Proc Spell Power
90993, -- Item - Proc Spell Power
95878, -- Item - Proc Mastery Rating
90943, -- Item - Proc Stacking Spell Power
90986, -- Item - Proc Stacking Spell Power
91011, -- Item - Proc Spell Power On Dmg
91025, -- Item - Proc Mastery
91031, -- Item - Proc Stacking Spell Power
91048, -- Item - Proc Spell Power
91080, -- Item - Proc Wandering DoT
91137, -- Item - Proc Spirit On Crit
91140, -- Item - Proc Spirit On Crit
91142, -- Item - Proc Haste Rating
91144, -- Item - Proc Haste Rating
91148, -- Item - Proc Spirit
91150, -- Item - Proc Spirit
91186, -- Item - Proc Spirit
91193, -- Item - Proc Intellect
91321, -- Item - Proc Stacking Spirit
91339, -- Item - Proc Stacking Strength
91353, -- Item - Proc Haste On Crit
91361, -- Item - Proc Strength
91365, -- Item - Proc Strength
91366, -- Item - Proc Strength On Crit
91369, -- Item - Proc Strength On Crit
91811, -- Item - Proc Stacking Strength
91814, -- Item - Proc Strength
91817, -- Item - Proc Strength
91822, -- Item - Proc Haste Rating
91833, -- Item - Proc Stacking Activator (5)
92044, -- Item - Proc Haste Rating
92054, -- Item - Proc Crit Rating
92056, -- Item - Proc Haste On Crit
92070, -- Item - Proc Agility
92086, -- Item - Proc Stacking Agility
92088, -- Item - Proc Crit Rating
92090, -- Item - Proc Stacking Agility
92093, -- Item - Proc Agility
92095, -- Item - Proc Agility On Crit
92097, -- Item - Proc Agility On Crit
92105, -- Item - Proc Stacking Agility
92114, -- Item - Proc Increased Attack Power
92125, -- Item - Proc Haste Rating
92127, -- Item - Proc Crit Rating
92164, -- Item - Proc Mastery Rating
92175, -- Item - Proc Mastery Rating
92319, -- Item - Proc Spell Power On Dmg
92322, -- Item - Proc Mastery
92326, -- Item - Proc Stacking Spell Power
92330, -- Item - Proc Stacking Spirit
92333, -- Item - Proc Spirit
92343, -- Item - Proc Haste Rating
92346, -- Item - Proc Strength
92350, -- Item - Proc Haste Rating
92353, -- Item - Proc Crit Rating
95763, -- Item - Proc Haste Rating
95873); -- Item - Proc Crit Rating - hw

-- Your melee and ranged critical strikes have a chance to grant stat_value for x seconds.
SET @PROC_FLAG := 0 | 0x00000154;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000002;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(92056, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Gear Detector 
(92095, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Left Eye of Rajh
(92097, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000);

-- Your melee and ranged attacks have a chance to grant x stat_value for x seconds.
SET @PROC_FLAG := 0 | 0x00000154;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(92044, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Bileberry Smelling Salts
(92054, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Grace of the Herald - Heart of the Vile
(92070, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Key to the Endless Chamber
(92093, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000),
(92086, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- Tia's Grace
(92090, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000),
(92088, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Grace of the Herald
(92105, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- Fluid Death
(92125, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Prestor's Talisman of Machination
(92127, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Essence of the Cyclone
(92353, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(95763, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Agony and Torment
(95873, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000); -- Herald of Doom

-- Your melee critical strikes have a chance to grant x stat_value for x seconds.
SET @PROC_FLAG := 0 | 0x00000014;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000002;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(91353, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Shrine-Cleansing Purifier - Tank-Commander Insignia
(91366, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Right Eye of Rajh
(91369, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000);

-- Your melee attacks grant / Your melee attacks have a chance to grant x stat_value.
SET @PROC_FLAG := 0 | 0x00000014;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(91339, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- Petrified Spider Crab
(91361, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000), -- Heart of Solace
(91365, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000),
(91811, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- License to Slay 
(91814, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000), -- Impetuous
(91817, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000), -- Heart of Rage
(92346, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000),
(91822, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Crushing Weight
(92343, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000),
(91833, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 5000), -- Fury of Angerforge
(92114, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Unheeded Warning
(92164, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Porcelain Crab - Harrison's Insignia of Panache - Schnottz's Medallion of Command 
(92175, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000); -- Porcelain Crab

-- Your healing spells have a chance to grant x stat_value for x seconds.
SET @PROC_FLAG := 0 | 0x00044000;
SET @TYPE_MASK := 0 | 0x00000002;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(91142, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Rainsong
(91144, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000),
(91148, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000), -- Blood of Isiset
(91150, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000),
(91186, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Fall of Morality
(92333, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000),
(91193, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Mandala of Stirring Patterns
(91321, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- Jar of Ancient Remedies
(92330, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000);

-- Your healing spell critical strikes have a chance to grant x stat_value for x seconds.
SET @PROC_FLAG := 0 | 0x00044000;
SET @TYPE_MASK := 0 | 0x00000002;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000002;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(91137, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Tear of Blood
(91140, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000);

-- Your damage spells grant X, increasing stat_value for x seconds.
SET @PROC_FLAG_P := 0 | 0x00050000;
SET @PROC_FLAG_N := 0 | 0x00010000;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(91031, @PROC_FLAG_P, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- Heart of Ignacious
(92326, @PROC_FLAG_P, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000);

-- Your harmful spells have a chance to grant x stat_value for x seconds.
SET @PROC_FLAG_P := 0 | 0x00050000;
SET @PROC_FLAG_N := 0 | 0x00010000;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(91011, @PROC_FLAG_P, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000), -- Bell of Enraging Resonance
(92319, @PROC_FLAG_P, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 100000),
(91025, @PROC_FLAG_N, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Theralion's Mirror
(92322, @PROC_FLAG_N, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(91048, @PROC_FLAG_N, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Stump of Time
(91080, @PROC_FLAG_N, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 120000); -- Harmlight Token 

-- Your spells have a chance to grant x stat_value for x seconds.
SET @PROC_FLAG := 0 | 0x00014000;
SET @TYPE_MASK := 0 | 0x00000007;
SET @PHASE_MASK := 0 | 0x00000001;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(90848, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Pelagic Prism
(90886, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Witching Hourglass
(90888, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000),
(90892, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000), -- Stonemother's Kiss
(90897, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000), -- Tendrills of Darkness
(90899, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 75000),
(90990, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000), -- Anhuur's Hymnal
(90993, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(95878, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 80000); -- Talisman of Sinister Order

-- Your healing and damage periodic spells grant x stat_value each time they heal or deal damage.
SET @PROC_FLAG := 0 | 0x00040000;
SET @TYPE_MASK := 0 | 0x00000001 | 0x00000002;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

DELETE FROM `spell_proc` WHERE `SpellId` IN (94746, 94747, 95472, 95709);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(90943, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000), -- Gale of Shadows
(90986, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 2000);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(94746, 0x00054000, 0x00000001 | 0x00000002, 0x00000002, 0x00000000, 45000), -- Enchant Weapon - Power Torrent
(94747, 0x00054400, 0x00000001 | 0x00000002, 0x00000002, 0x00000000, 45000), -- Enchant Weapon - Hurricane
(95472, 0x00050000, 0x00000001, 0x00000002, 0x00000000, 45000), -- Enchant Weapon - Avalanche
(95709, 0x00050000, 0x00000001, 0x00000002, 0x00000000, 45000); -- Enchant Weapon - Mending

DELETE FROM `spell_proc` WHERE `SpellId`= 52007;
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(52007, 0x00044000, 0x00000002, 0x00000002, 0x00000000, 0); -- Earthliving Weapon (Passive)


DELETE FROM `spell_proc` WHERE `SpellId` IN (31878, 20154);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(31878, 10, 0x00800000, 0x00001110, 0x00000001, 0x00000001, 0x00000000, 32 | 64),
(20154, 0,  0,          0x00000014, 1,          2,          0,          32 | 64);

UPDATE `spell_proc` SET `ProcFlags`= 0x00000014, `ProcsPerMinute`= 0 WHERE `SpellId`= 20164;


-- Difficulty spell entries
DELETE FROM `spell_dbc` WHERE `Id` IN (42636, 45433, 90120, 92943, 90059, 92948, 89289, 92951, 94991, 95858, 92666, 95884, 98192, 98846, 98900, 99288, 98899, 99551, 99877, 99878, 107352, 108859, 110615, 110614, 110035, 110034, 110033, 110032, 103179, 110515);
INSERT INTO `spell_dbc`(`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellInterruptsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `Comment`) VALUES
(107352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Twilight Barrage'),
(108859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4343 spellid1 serverside spell'),
(110615, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4343 spellid2 serverside spell'),
(110614, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4343 spellid3 serverside spell'),
(110035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Countdown'),
(110034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4444 spellid1 serverside spell'),
(110033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4444 spellid2 serverside spell'),
(110032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4444 spellid3 serverside spell'),
(103179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Black Blood of the Earth'),
(110515, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:4469 spellid1 serverside spell'),
(42636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Birmingham Tools Test 3'),
(45433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Birmingham Tools Test 5'),
(90120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Summon Drake'),
(92943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Inspired'),
(90059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Summon Spitecaller'),
(92948, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3255 spellid1 serverside spell'),
(89289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Twilight Essence'),
(92951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3258 spellid1 serverside spell'),
(94991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3523 spellid1 serverside spell'),
(95858, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3579 spellid1 serverside spell'),
(92666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Summon Imp Trigger'),
(95884, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3582 spellid1 serverside spell'),
(98192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Foot Damage Tracker'),
(98846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3741 spellid1 serverside spell'),
(98900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Drone Trigger'),
(99288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3749 spellid1 serverside spell'),
(98899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Spiderling Trigger'),
(99551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3752 spellid1 serverside spell'),
(99877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Summon Armor Elementals'),
(99878, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 'Spelldifficulty_dbc id:3764 spellid1 serverside spell');

-- GameObject spells
DELETE FROM `spell_dbc` WHERE `Id` IN (84506, 84505, 90245, 90244, 86761, 89691, 89685, 81358, 96364, 85892, 85891, 48084, 48085, 43981, 82094);
INSERT INTO `spell_dbc`(`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellInterruptsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `Comment`) VALUES
(84506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Teleport to Orgrimmar'),
(84505, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Teleport to Stormwind'),
(90245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) <INTERNAL>Stormwind Portal to Vashj''ir (from Portal)'),
(90244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) <INTERNAL>Orgrimmar Portal to Vashj''ir (from Portal)'),
(86761, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Keg Cover Spell'),
(89691, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) The Mad Magus: Ajamon''s Portal - Teleport to Southsea Holdfast - Cover'),
(89685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) The Mad Magus: Ajamon''s Portal - Teleport to Tirth''s Haunt - Cover'),
(81358, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Swabbing Duty: Force Summon Controller'),
(96364, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Create S.A.F.E. ""Parachute""'),
(85892, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Victory From Within: Library Wing Quest Credit'),
(85891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Victory From Within: Hall of Arms Quest Credit'),
(82094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Force Periscope');

-- Quest template, spellclick, encounter credit related spells
DELETE FROM `spell_dbc` WHERE `Id` IN (94641, 98867, 89249, 89848, 89781, 94998, 89550, 88469, 90404, 89669, 90372, 89762, 95203, 82359, 82456, 110158, 111533);
INSERT INTO `spell_dbc`(`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellInterruptsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `Comment`) VALUES
(94641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Cancel Tonga''s Eyes'),
(98867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Destroy Cudgel of Discipline - Delay'),
(89249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Perfect Costume Credit'),
(89848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Launch Quest: Placing the Pawns'),
(89781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Protector Growth Validate'),
(94998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Achievement Check - Full Caravan'),
(89550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Sapling Growth Validate'),
(88469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Rendan''s Weakness: Despawn Dancers'),
(90404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Launch Quest: Placing the Pawns'),
(89669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Fluorishing Protector Root Trigger'),
(90372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Summon Whelplings'),
(89762, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) The Elder Crone: Quest Complete'),
(95203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Summon Main Cutscene Vehicle [INTERNAL ONLY]'),
(82359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Reactivate the Constructs: Dummy to Deactivated Construct On Interact'),
(82456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Sprout No More: Dummy to Giant Mushroom On Interact'),
(110158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Achievement Credit'),
(111533, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Deathwing Kill Credit <Do Not Translate>');

-- spell_proc fixups
UPDATE `spell_proc` SET `AttributesMask`= 0 WHERE `SpellId`= 48108;
DELETE FROM `spell_proc` WHERE `SpellId` IN (-20234, 30675, 31244, 31876, -44404, -49182, 53290, -53380, 54747, -64127, 1719, 11129, 24932, 53646, 54754, 54937, 54939, 55677, 62259, 63280, 53551, 48516, 44449, -34753, 20925, -18119, 57870, -30299, 17364, 43819, 55689, 58620, 63611, 1120, -53583);
UPDATE `spell_proc` SET `ProcFlags`= 0x00010000 WHERE `SpellId` IN (47383, 71162, 71165);
UPDATE `spell_proc` SET `ProcFlags`= 0x00000004 | 0x00000010 WHERE `SpellId`= 62606;
UPDATE `spell_proc` SET `SpellPhaseMask`= 2 WHERE `SpellId` IN (70664, 31656, -48539, 28716, 40438, 56218, 62606, -47245, -47195, -19572, 37603, 38394, 40478, 45054, 60061, 60170, 60176, 60487, 61188, 64752, 64824, 64914, 67209, 67356, 67361, 67365, 70730, 70841, 70854, 71174, 71176, 71178, 71198, 71606, 71637, -12317);
UPDATE `spell_proc` SET `SpellPhaseMask`= 0, `SpellTypeMask`= 0 WHERE `SpellId` IN (-49018, -53486, -33191, 46832, 74981, 90738, 90759, 87900, 87897);
UPDATE `spell_proc` SET `ProcFlags`= 0x000A22A8 WHERE `SpellId`= -30299;
UPDATE `spell_proc` SET `ProcFlags`= 0x00014000, `HitMask`= 0 WHERE `SpellId`= -16880;
UPDATE `spell_proc` SET `SpellPhaseMask`= 1, `SpellId`= -12322 WHERE `SpellId`= 12322;
UPDATE `spell_proc` SET `HitMask`= 0 WHERE `SpellId` IN (84722, 84723);
UPDATE `spell_proc` SET `ProcFlags`= 0x00015000, `HitMask`= 0 WHERE `SpellId`= -48965;

DELETE FROM `spell_proc` WHERE `SpellId`= 56453;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyMask1`, `SpellPhaseMask`, `HitMask`) VALUES
(56453, 0x80000000, 1, 0);

-- Spell Procs
DELETE FROM `spell_proc` WHERE `SpellId` IN (86622, 95639, 95640, 95641, 93053);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`) VALUES
(86622, 0x00055554, 1 | 2, 2, 0, 32, 0),
(95639, 0x00055554, 1 | 2, 2, 0, 32, 0),
(95640, 0x00055554, 1 | 2, 2, 0, 32, 0),
(95641, 0x00055554, 1 | 2, 2, 0, 32, 0),
(93053, 0x00000004, 0, 0, 0, 0, 20000);

-- Vault of Lights achievement check spell not in dbc
DELETE FROM `spell_dbc` WHERE `Id` = 94067;
INSERT INTO `spell_dbc` (`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `SpellInterruptsId`, `Comment`) VALUES
(94067, 384, 0, 5, 256, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vault of Lights achievement credit');

DELETE FROM `spelleffect_dbc` WHERE `Id` = 155917;
INSERT INTO `spelleffect_dbc` (`Id`, `Effect`, `EffectValueMultiplier`, `EffectApplyAuraName`, `EffectAmplitude`, `EffectBasePoints`, `EffectBonusMultiplier`, `EffectDamageMultiplier`, `EffectChainTarget`, `EffectDieSides`, `EffectItemType`, `EffectMechanic`, `EffectMiscValue`, `EffectMiscValueB`, `EffectRadiusIndex`, `EffectRadiusIndexMax`, `EffectRealPointsPerLevel`, `EffectSpellClassMaskA`, `EffectSpellClassMaskB`, `EffectSpellClassMaskC`, `EffectTriggerSpell`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectSpellId`, `EffectIndex`, `Comment`) VALUES
(155917, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 94067, 0, '');

UPDATE `spell_proc` SET `Chance`= 100, `SpellFamilyMask0`= 0, `SpellFamilyMask1` = 0x00000004 | 0x00020000 WHERE `SpellId`= 51124;

DELETE FROM `spell_proc` WHERE `spellId`= 56835;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(56835, 15, 0x00400000, 0x00010000, 0x00000200, 0x00011010, 0x1, 0x1, 0x0, 0x0);

DELETE FROM `spell_proc` WHERE `spellId`= 50034;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(50034, 15, 0x00000010, 0x00020000, 0x0, 0x00015550, 0x1, 0x1, 0x0, 0x0);

-- Serverside spells
DELETE FROM `spell_dbc` WHERE `Id` IN (91676, 91741);
INSERT INTO `spell_dbc`(`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellInterruptsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `Comment`) VALUES
(91676, 0x29800100, 0x00000420, 0x10484005, 0x10130200, 0x00800080, 0x00060008, 0x00001200, 0, 0x00000008, 0, 0, 1, 30, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Create Empty Spot'),
(91741, 0x29800100, 0x00000420, 0x10484005, 0x10130200, 0x00800080, 0x00060008, 0x00001200, 0, 0x00000008, 0, 0, 1, 30, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Create Random Sun Power');

DELETE FROM `spelleffect_dbc` WHERE `Id` IN (160081, 160082);
INSERT INTO `spelleffect_dbc` (`Id`, `Effect`, `EffectBasePoints`, `EffectMiscValue`, `EffectMiscValueB`, `EffectRadiusIndex`, `EffectRadiusIndexMax`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectSpellId`, `EffectIndex`, `Comment`) VALUES
(160081, 28, 0, 49190, 3077, 0, 0, 87, 0, 91676, 0, 'Create Empty Spot'),
(160082, 28, 0, 49194, 3077, 0, 0, 87, 0, 91741, 0, 'Create Random Sun Power');

DELETE FROM `spell_proc` WHERE `spellId` IN (13877, 33735, 51211, 65956);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(13877, 0, 0, 0, 0, 0x00000014, 0x1, 0x2, 0x0, 0x0),
(33735, 0, 0, 0, 0, 0x00000014, 0x1, 0x2, 0x0, 0x0),
(51211, 0, 0, 0, 0, 0x00000014, 0x1, 0x2, 0x0, 0x0),
(65956, 0, 0, 0, 0, 0x00000014, 0x1, 0x2, 0x0, 0x0);

-- Update Revitalize Proc
UPDATE `spell_proc` SET `SpellFamilyMask0`= 0x00000010, `SpellFamilyMask1`= 0x00000010, `SpellFamilyMask2`= 0, `ProcFlags`= 0x00040000, `SpellTypeMask`= 2, `SpellPhaseMask`= 2, `HitMask`= 0, `Cooldown`= 12000 WHERE `SpellId`= -48539;
-- Update Nature's Grace Proc
UPDATE `spell_proc` SET `SpellFamilyMask0`= 0x00000002 | 0x00200000 | 0x00000040, `SpellFamilyMask1`= 0, `SpellFamilyMask2`= 0, `ProcFlags`= 0x00014000, `SpellTypeMask`= 1 | 2, `SpellPhaseMask`= 1, `HitMask`= 0 WHERE `SpellId`= -16880;


DELETE FROM `spell_proc` WHERE `SpellId` IN (-34151);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(-34151, 7, 0, 0x00000002, 0, 0x00004000, 0x2, 0x2, 0x0, 0x0);

DELETE FROM `spell_proc` WHERE `SpellId`= 54832;

DELETE FROM `spell_proc` WHERE `SpellId`= 76806;
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(76806, 0, 0, 0x0, 0x0, 0x0, 0x0, 1, 2, 0, 32, 0, 0,  0, 0);

-- Serverside spells
DELETE FROM `spell_dbc` WHERE `Id`= 92079;
INSERT INTO `spell_dbc`(`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellInterruptsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `Comment`) VALUES
(92079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Shrink');

DELETE FROM `spelleffect_dbc` WHERE `Id`= 160083;
INSERT INTO `spelleffect_dbc` (`Id`, `Effect`, `EffectApplyAuraName`, `EffectBasePoints`, `EffectMiscValue`, `EffectMiscValueB`, `EffectRadiusIndex`, `EffectRadiusIndexMax`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectSpellId`, `EffectIndex`, `Comment`) VALUES
(160083, 6, 61, -90, 0, 0, 0, 0, 0, 0, 92079, 0, 'Shrink');
DELETE FROM `spell_proc` WHERE `SpellId` IN (92207, 92209);

SET @PROC_FLAG := 0 | 0x00000028;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000000;
SET @HIT_MASK := 0 | 0x00000020;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(92207, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 60000), -- Throngus' Finger
(92209, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 60000); -- Throngus' Finger

DELETE FROM `spell_proc` WHERE `spellId` IN (89086, 89088, 89183, 101292, 101290, 101288);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Chance`, `AttributesMask`, `Cooldown`) VALUES
-- Darkmoon Cards
(89086, 0, 0, 0x0, 0x0, 0x0, 0x00000154, 0x1, 0x2, 0x0, 5, 0x0, 0),
(89088, 0, 0, 0x0, 0x0, 0x0, 0x00050000, 0x1, 0x2, 0x0, 0, 0x0, 45000),
(89183, 0, 0, 0x0, 0x0, 0x0, 0x00044000, 0x2, 0x2, 0x0, 0, 0x0, 7000),
-- Festival Trinkets
(101292, 0, 0, 0x0, 0x0, 0x0, 0x00010000, 0x1, 0x1, 0x0, 0, 0x0, 50000),
(101290, 0, 0, 0x0, 0x0, 0x0, 0x00044000, 0x2, 0x2, 0x0, 0, 0x0, 50000),
(101288, 0, 0, 0x0, 0x0, 0x0, 0x00000154, 0x1, 0x2, 0x0, 0, 0x0, 50000);

DELETE FROM `spell_proc` WHERE `SpellId`= 17007;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`) VALUES
(17007, 0, 0x00000014, 0x00000001, 0x00000002, 0x00000002, 0x0, 6000);

DELETE FROM `spell_proc` WHERE `SpellId` IN (85011, 85013, 85014, 85034, 92217, 92221, 99718, 99747, 99749, 102433, 105136, 105140);

-- When you deal damage you have a chance to gain xxx value
SET @PROC_FLAG := 0 | 0x00051154;
SET @TYPE_MASK := 0 | 0x00000001;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(85011, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(85013, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(85014, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(85034, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(92217, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(92221, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(99718, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(99747, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(99749, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(102433, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(105136, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(105140, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000);

DELETE FROM `spell_proc` WHERE `SpellId` IN (85024, 92219, 99720, 99743, 102436, 102440, 105138);
-- When you deal damage or heal you have a chance to gain xxx value
SET @PROC_FLAG := 0 | 0x00051154;
SET @TYPE_MASK := 0 | 0x00000003;
SET @PHASE_MASK := 0 | 0x00000002;
SET @HIT_MASK := 0 | 0x00000000;

INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `Cooldown`) VALUES
(85024, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(92219, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(99720, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(99743, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(102436, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(102440, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000),
(105138, @PROC_FLAG, @TYPE_MASK, @PHASE_MASK, @HIT_MASK, 50000);
DELETE FROM `spell_proc` WHERE `SpellId`= -93398;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`) VALUES
(-93398, 0x00000002 | 0x00200000, 0x0, 0x0, 0x00040000, 1, 2, 0, 0, 60000);

DELETE FROM `spell_proc` WHERE `SpellId` IN (93400, 81093);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(93400, 7, 0, 0, 0x02000000, 0x00010000, 1, 1, 0, 8, 0, 1, 100),
(81093, 7, 0x00000004, 0, 0, 0x00010000, 1, 1, 0, 8, 0, 1, 100);

DELETE FROM `spell_proc` WHERE `spellId` IN (33603, 33604, 33605);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`) VALUES
(33603, 7, 0x00000002, 0x0, 0x0, 0x00010000, 0x1, 0x1, 0x0, 0),
(33604, 7, 0x00000002, 0x0, 0x0, 0x00010000, 0x1, 0x1, 0x0, 32),
(33605, 7, 0x00000002, 0x0, 0x0, 0x00010000, 0x1, 0x1, 0x0, 32);
UPDATE `spell_proc` SET `SpellTypeMask`= 1 WHERE `SpellId`= 48506;

UPDATE `spell_proc` SET `ProcFlags`= 0 WHERE `SpellId`= 76806;

DELETE FROM `spell_proc` WHERE `SpellId`= 73681;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(73681, 0, 0, 0, 0, 0, 0, 0, 12287, 0, 0, 6, 100);

DELETE FROM `spell_proc` WHERE `SpellId` IN (16257, 16277, 16278);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(16257, 0, 0, 0, 0, 0, 0, 0, 12287, 0, 0, 0, 100),
(16277, 0, 0, 0, 0, 0, 0, 0, 12287, 0, 0, 0, 100),
(16278, 0, 0, 0, 0, 0, 0, 0, 12287, 0, 0, 0, 100);

DELETE FROM `spell_proc` WHERE `SpellId`= -51525;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-51525, 11, 0x00000000, 0x01000010, 0x00020000 | 0x00000004, 0, 1, 1, 0, 0, 0, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId`= -63373;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-63373, 11, 0x80000000, 0, 0, 0x00010000, 1, 2, 0, 16, 0, 0, 100);

SET @FAMILYMASK0 := 0x00000400 | 0x00000800 | 0x00001000 | 0x00000200 | 0x00000080;
SET @FAMILYMASK1 := 0x00000004 | 0x00000020;
SET @FAMILYMASK2 := 0x00010000 | 0x00000000;

DELETE FROM `spell_proc` WHERE `SpellId` IN (14751, 88627);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(14751, 6, @FAMILYMASK0, @FAMILYMASK1, @FAMILYMASK2, 0, 2, 1, 0, 0, 0, 1, 100),
(88627, 0, 0x0, 0x0, 0x0, 0, 0, 1, 0, 16, 0, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId`= 88688;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(88688, 6, 0x00000800, 0x0, 0x0, 0x00004000, 1, 1, 0, 0, 0, 1, 100);

-- Serverside spells
-- Difficulty spell entries
DELETE FROM `spell_dbc` WHERE `Id` IN (82675, 82697, 88578, 84916, 84947, 92080, 92081);
INSERT INTO `spell_dbc`(`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `CastingTimeIndex`, `DurationIndex`, `RangeIndex`, `SchoolMask`, `SpellAuraOptionsId`, `SpellCastingRequirementsId`, `SpellCategoriesId`, `SpellClassOptionsId`, `SpellEquippedItemsId`, `SpellInterruptsId`, `SpellLevelsId`, `SpellTargetRestrictionsId`, `Comment`) VALUES
(82675, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Water Bomb'),
(82697, 0, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Water Bomb'),
(88578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Inferno Rush'),
(84916, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Liquid Ice'),
(84947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Gravity Crush'),
(92080, 0, 0, 4, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Flame Strike'),
(92081, 0, 0, 4, 256, 0, 0, 0, 0, 0, 0, 0, 0, 21, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, '(Serverside/Non-DB2) Flame Strike');

DELETE FROM `spelleffect_dbc` WHERE `Id` IN (160084, 160085, 160086, 160087, 160088, 160089, 160090);
INSERT INTO `spelleffect_dbc` (`Id`, `Effect`, `EffectBasePoints`, `EffectMiscValue`, `EffectMiscValueB`, `EffectRadiusIndex`, `EffectRadiusIndexMax`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectSpellId`, `EffectIndex`, `Comment`) VALUES
(160084, 28, 1, 44201, 64, 8, 8, 53, 91, 82675, 0, 'Water Bomb - Summon'),
(160085, 3, 82675, 0, 0 , 12, 12, 22, 15, 82697, 0, 'Water Bomb - Dummy'),
(160086, 28, 1, 47501, 64, 0, 0, 87, 87, 88578, 0, 'Inferno Rush - Summon'),
(160087, 28, 1, 45452, 64, 0, 0, 18, 0, 84916, 0, 'Liquid Ice - Summon'),
(160088, 28, 1, 45476, 64, 0, 0, 18, 0, 84947, 0, 'Gravity Crush - Summon'),
(160089, 3, 92081, 0, 0 , 30, 30, 22, 15, 92080, 0, 'Flame Strike - Dummy'),
(160090, 28, 1, 49432, 64, 0, 0, 53, 0, 92081, 0, 'Flame Strike - Summon');

DELETE FROM `spell_proc` WHERE `SpellId` IN (31801, 89901);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(31801, 0, 0, 0, 0, 0, 1, 2, 0, 32 | 64, 0, 0, 0),
(89901, 10, 0x00800000, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId` IN (-87168, 31876, 85285);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-87168, 10, 0x00800000, 0, 0, 0x00000110, 1, 1, 0, 0, 0, 0, 100),
(31876, 10, 0x00800000, 0, 0, 0x00000110, 1, 1, 0, 0, 0, 0, 100),
(85285, 0, 0, 0, 0, 0, 1, 0, 0, 0, 60000, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId`= -85803;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-85803, 10, 0, 0, 0x00004000, 0, 2, 2, 0, 16 | 64, 0, 0, 0);

SET @FAMILY_FLAGS1 := 0 | 0x00800000;
SET @FAMILY_FLAGS2 := 0 | 0x00000002 | 0x00200000 | 0x00000080;
SET @FAMILY_FLAGS3 := 0 | 0x00002000 | 0x00008000;
SET @PROC_FLAGS    := 0 | 0x00000010 | 0x00000400| 0x00004000 | 0x00010000 | 0x00800000;

DELETE FROM `spell_proc` WHERE `SpellId` IN (-85117, 90174);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-85117, 10, @FAMILY_FLAGS1, @FAMILY_FLAGS2, @FAMILY_FLAGS3, @PROC_FLAGS, 7, 1, 0, 0, 0, 0, 100),
(90174, 10, 0, 0, 0, @PROC_FLAGS, 7, 1, 0, 8, 0, 1, 100);

UPDATE `spell_proc` SET `SpellId`= -20911 WHERE `SpellId`= 20911;

DELETE FROM `spell_proc` WHERE `SpellId` IN (62600);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(62600, 0, 0, 0, 0, 0, 1, 2, 2, 32, 0, 0, 50);

DELETE FROM `spell_proc` WHERE `SpellId` IN (76524, 93658);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(76524, 0, 0, 0, 0, 0x00008000| 0x00080000, 7, 0, 0, 0, 0, 0, 100),
(93658, 0, 0, 0, 0, 0x00008000| 0x00080000, 7, 0, 0, 0, 0, 0, 100);

UPDATE `spell_proc` SET `HitMask`= 0 WHERE `SpellId`= -16487;

DELETE FROM `spell_proc` WHERE `SpellId`= -50685;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-50685, 4, 0x00000040, 0, 0, 0, 1, 2, 2, 0, 0, 0, 0);
UPDATE `spell_proc` SET `HitMask`= 64 | 2048, `ProcFlags`= 0x000002A8 | 0x00020000 WHERE `SpellId`= -12298;

DELETE FROM `spell_proc` WHERE `SpellId` IN (-84604, -80128);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-84604, 0, 0, 0, 0, 0, 0, 0, 0x00000020, 0, 0, 0, 0),
(-80128, 4, 0, 0x00000040, 0, 0x00000010, 1, 2, 0, 0, 0, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId`= 105765;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(105765, 10, 0x00800000, 0, 0x00000008, 0, 1, 1, 0, 0, 0, 0, 0);

-- Procs
DELETE FROM `spell_proc` WHERE `SpellId`= 76167;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(76167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId` IN (89485, -57470);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(89485, 6, 0x00000200 | 0x00000800 | 0x00001000, 0x00000004, 0, 0x00004000, 2, 1, 0, 0, 0, 1, 100),
(-57470, 0, 0, 0, 0, 0, 2, 1, 0, 16, 0, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId`= 95774;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(95774, 11, 0x00100000, 0, 0, 0x00010000, 1, 1, 0, 0, 0, 1, 100);

DELETE FROM `spell_proc` WHERE `SpellId`= 95774;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(95774, 11, 0x00100000, 0, 0, 0x00010000, 1, 1, 0, 16, 0, 1, 100);

DELETE FROM `spell_proc` WHERE `SpellId`= -81659;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-81659, 6, 0x00000080 | 0x00100000, 0, 0x00000440, 0, 1, 1, 0, 0, 0, 0, 0);

DELETE FROM `spell_proc` WHERE `SpellId`= -17056;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-17056, 7, 0x40000000 | 0x80000000, 0, 0, 0x00000800, 0, 0, 0, 0, 0, 0, 100);
UPDATE `spell_proc` SET `SpellFamilyMask0`= 0x00400000 | 0x00000010 WHERE `SpellId`= -11095;

DELETE FROM `spell_proc` WHERE `SpellId`= -89488;
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-89488, 6, 0x00000400 | 0x00001000 | 0x00000800, 0x40000000, 0, 0, 2 | 4, 2, 0, 0, 0, 0, 0);

UPDATE `spell_proc` SET `HitMask`= 1024 WHERE `SpellId`= 76167;

DELETE FROM `spell_proc` WHERE `SpellId` IN (56807, 51698, 51700, 51701, -51698);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(56807, 8, 0x02000000, 0, 0, 0x00000010, 1, 2, 0, 0, 0, 0, 100),
(-51698, 0, 0, 0, 0, 0x00055110, 1, 2, 2, 0, 2000, 0, 0);
DELETE FROM `spell_proc` WHERE `SpellId` IN (-51632);
INSERT INTO `spell_proc` (`SpellId`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `Cooldown`, `Charges`, `Chance`) VALUES
(-51632, 8, 0x00000200 | 0x00000100 | 0x00000400, 0, 0, 0, 1 | 4, 2, 0, 0, 0, 0, 0);
UPDATE `spelleffect_dbc` SET `EffectApplyAuraName`= 230, `EffectMiscValue`= 0 WHERE `EffectSpellId`= 35657 AND `EffectIndex`= 0;
UPDATE `spelleffect_dbc` SET `EffectApplyAuraName`= 35, `EffectMiscValue`= 0 WHERE `EffectSpellId`= 35658 AND `EffectIndex`= 0;

