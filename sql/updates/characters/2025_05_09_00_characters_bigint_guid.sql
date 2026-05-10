-- 64-bit GUID Migration: characters database
-- Converts all player/item/pet/creature entity GUID columns from INT UNSIGNED
-- (or MEDIUMINT UNSIGNED) to BIGINT UNSIGNED.

-- ─── Player GUIDs ──────────────────────────────────────────────────────────

-- characters: primary key (player guid, AUTO_INCREMENT implied by application)
ALTER TABLE `characters`
  MODIFY COLUMN `guid`      BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  MODIFY COLUMN `transguid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_account_data
ALTER TABLE `character_account_data`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_achievement
ALTER TABLE `character_achievement`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL;

-- character_achievement_progress
ALTER TABLE `character_achievement_progress`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL;

-- character_action
ALTER TABLE `character_action`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_arena_stats
ALTER TABLE `character_arena_stats`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_aura (casterGuid/itemGuid are already BIGINT)
ALTER TABLE `character_aura`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_banned
ALTER TABLE `character_banned`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_battleground_data
ALTER TABLE `character_battleground_data`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_battleground_random
ALTER TABLE `character_battleground_random`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_declinedname
ALTER TABLE `character_declinedname`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_equipmentsets (setguid is already BIGINT AUTO_INCREMENT)
ALTER TABLE `character_equipmentsets`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_fishingsteps
ALTER TABLE `character_fishingsteps`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_gifts: guid is the character GUID, item_guid is the item GUID
ALTER TABLE `character_gifts`
  MODIFY COLUMN `guid`      BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `item_guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_glyphs
ALTER TABLE `character_glyphs`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_homebind
ALTER TABLE `character_homebind`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_instance
ALTER TABLE `character_instance`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_inventory
ALTER TABLE `character_inventory`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_queststatus
ALTER TABLE `character_queststatus`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_queststatus_daily
ALTER TABLE `character_queststatus_daily`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_queststatus_monthly
ALTER TABLE `character_queststatus_monthly`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_queststatus_rewarded
ALTER TABLE `character_queststatus_rewarded`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_queststatus_seasonal
ALTER TABLE `character_queststatus_seasonal`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_queststatus_weekly
ALTER TABLE `character_queststatus_weekly`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_reputation
ALTER TABLE `character_reputation`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_skills
ALTER TABLE `character_skills`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL COMMENT 'Global Unique Identifier';

-- character_social
ALTER TABLE `character_social`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier';

-- character_spell
ALTER TABLE `character_spell`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part';

-- character_spell_cooldown
ALTER TABLE `character_spell_cooldown`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part';

-- character_stats
ALTER TABLE `character_stats`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- character_talent
ALTER TABLE `character_talent`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL;

-- ─── Item GUIDs ────────────────────────────────────────────────────────────

-- item_instance: guid is item GUID (primary key); owner/creator/giftCreator are character GUIDs
ALTER TABLE `item_instance`
  MODIFY COLUMN `guid`            BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `owner_guid`      BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `creatorGuid`     BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `giftCreatorGuid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- item_loot_items: container_id references item_instance.guid
ALTER TABLE `item_loot_items`
  MODIFY COLUMN `container_id` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)';

-- item_loot_money: container_id references item_instance.guid
ALTER TABLE `item_loot_money`
  MODIFY COLUMN `container_id` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)';

-- item_refund_instance
ALTER TABLE `item_refund_instance`
  MODIFY COLUMN `item_guid`   BIGINT UNSIGNED NOT NULL COMMENT 'Item GUID',
  MODIFY COLUMN `player_guid` BIGINT UNSIGNED NOT NULL COMMENT 'Player GUID';

-- item_soulbound_trade_data
ALTER TABLE `item_soulbound_trade_data`
  MODIFY COLUMN `itemGuid` BIGINT UNSIGNED NOT NULL COMMENT 'Item GUID';

-- ─── Pet GUIDs ─────────────────────────────────────────────────────────────

-- character_pet: id is pet GUID (primary key), owner is character GUID
ALTER TABLE `character_pet`
  MODIFY COLUMN `id`    BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `owner` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- character_pet_declinedname
ALTER TABLE `character_pet_declinedname`
  MODIFY COLUMN `id`    BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `owner` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- pet_aura (casterGuid already BIGINT)
ALTER TABLE `pet_aura`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- pet_spell
ALTER TABLE `pet_spell`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- pet_spell_cooldown
ALTER TABLE `pet_spell_cooldown`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part';

-- ─── Mail ──────────────────────────────────────────────────────────────────

-- mail: sender/receiver are character GUIDs
ALTER TABLE `mail`
  MODIFY COLUMN `sender`   BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  MODIFY COLUMN `receiver` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier';

-- mail_items: item_guid is item GUID; receiver is character GUID
ALTER TABLE `mail_items`
  MODIFY COLUMN `item_guid` BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `receiver`  BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier';

-- ─── Auction House ─────────────────────────────────────────────────────────

-- auctionhouse: itemguid is item GUID; itemowner/buyguid are character GUIDs
ALTER TABLE `auctionhouse`
  MODIFY COLUMN `itemguid`  BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `itemowner` BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `buyguid`   BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- auctionbidders: bidderguid is character GUID
ALTER TABLE `auctionbidders`
  MODIFY COLUMN `bidderguid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- ─── Corpse ────────────────────────────────────────────────────────────────

-- corpse: guid is the owning character's GUID
ALTER TABLE `corpse`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- ─── Guild ─────────────────────────────────────────────────────────────────

ALTER TABLE `guild`
  MODIFY COLUMN `leaderguid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE `guild_bank_eventlog`
  MODIFY COLUMN `PlayerGuid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE `guild_bank_item`
  MODIFY COLUMN `item_guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE `guild_eventlog`
  MODIFY COLUMN `PlayerGuid1` BIGINT UNSIGNED NOT NULL COMMENT 'Player 1',
  MODIFY COLUMN `PlayerGuid2` BIGINT UNSIGNED NOT NULL COMMENT 'Player 2';

ALTER TABLE `guild_member`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL;

ALTER TABLE `guild_member_withdraw`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- ─── Groups ────────────────────────────────────────────────────────────────

ALTER TABLE `group_instance`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE `group_member`
  MODIFY COLUMN `guid`       BIGINT UNSIGNED NOT NULL,
  MODIFY COLUMN `memberGuid` BIGINT UNSIGNED NOT NULL;

ALTER TABLE `groups`
  MODIFY COLUMN `guid`             BIGINT UNSIGNED NOT NULL,
  MODIFY COLUMN `leaderGuid`       BIGINT UNSIGNED NOT NULL,
  MODIFY COLUMN `looterGuid`       BIGINT UNSIGNED NOT NULL,
  MODIFY COLUMN `masterLooterGuid` BIGINT UNSIGNED NOT NULL;

-- ─── Arena ─────────────────────────────────────────────────────────────────

ALTER TABLE `arena_team`
  MODIFY COLUMN `captainGuid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE `arena_team_member`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- ─── Battleground ──────────────────────────────────────────────────────────

ALTER TABLE `battleground_deserters`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL COMMENT 'characters.guid';

-- ─── LFG ───────────────────────────────────────────────────────────────────

ALTER TABLE `lfg_data`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';

-- ─── Petitions ─────────────────────────────────────────────────────────────

ALTER TABLE `petition`
  MODIFY COLUMN `ownerguid`    BIGINT UNSIGNED NOT NULL,
  MODIFY COLUMN `petitionguid` BIGINT UNSIGNED DEFAULT '0';

ALTER TABLE `petition_sign`
  MODIFY COLUMN `ownerguid`    BIGINT UNSIGNED NOT NULL,
  MODIFY COLUMN `petitionguid` BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `playerguid`   BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- ─── GM Tickets / Surveys ──────────────────────────────────────────────────

ALTER TABLE `gm_survey`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE `gm_ticket`
  MODIFY COLUMN `playerGuid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  MODIFY COLUMN `assignedTo` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned';

-- ─── PvP Stats ─────────────────────────────────────────────────────────────

ALTER TABLE `pvpstats_players`
  MODIFY COLUMN `character_guid` BIGINT UNSIGNED NOT NULL;

-- ─── Quest Tracker ─────────────────────────────────────────────────────────

ALTER TABLE `quest_tracker`
  MODIFY COLUMN `character_guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- ─── Respawn ───────────────────────────────────────────────────────────────

-- respawn.spawnId references creature.guid or gameobject.guid
ALTER TABLE `respawn`
  MODIFY COLUMN `spawnId` BIGINT UNSIGNED NOT NULL;

-- ─── Lag Reports ───────────────────────────────────────────────────────────

ALTER TABLE `lag_reports`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';
