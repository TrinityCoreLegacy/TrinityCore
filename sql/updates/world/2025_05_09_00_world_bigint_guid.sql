-- 64-bit GUID Migration: world database
-- Converts all spawn/entity GUID columns from INT UNSIGNED to BIGINT UNSIGNED.
-- Run AFTER characters migration or standalone; no cross-database FKs exist here.

-- creature: primary key (AUTO_INCREMENT)
ALTER TABLE `creature`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier';

-- creature_addon: FK to creature.guid
ALTER TABLE `creature_addon`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- creature_formations: both leader and member reference creature.guid
ALTER TABLE `creature_formations`
  MODIFY COLUMN `leaderGUID` BIGINT UNSIGNED NOT NULL DEFAULT '0',
  MODIFY COLUMN `memberGUID` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- creature_movement_override: references creature.guid as spawn ID
ALTER TABLE `creature_movement_override`
  MODIFY COLUMN `SpawnId` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- game_event_creature: references creature.guid
ALTER TABLE `game_event_creature`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL;

-- game_event_gameobject: references gameobject.guid
ALTER TABLE `game_event_gameobject`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL;

-- game_event_model_equip: references creature.guid
ALTER TABLE `game_event_model_equip`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- game_event_npc_vendor: references creature.guid
ALTER TABLE `game_event_npc_vendor`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- game_event_npcflag: references creature.guid
ALTER TABLE `game_event_npcflag`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- gameobject: primary key (AUTO_INCREMENT)
ALTER TABLE `gameobject`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier';

-- gameobject_addon: FK to gameobject.guid
ALTER TABLE `gameobject_addon`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- gameobject_overrides: references gameobject.guid as spawn ID
ALTER TABLE `gameobject_overrides`
  MODIFY COLUMN `spawnId` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- linked_respawn: both columns reference creature.guid / gameobject.guid
ALTER TABLE `linked_respawn`
  MODIFY COLUMN `guid`       BIGINT UNSIGNED NOT NULL COMMENT 'dependent creature',
  MODIFY COLUMN `linkedGuid` BIGINT UNSIGNED NOT NULL COMMENT 'master creature';

-- pool_members: spawnId references creature.guid or gameobject.guid;
--               poolSpawnId references pool_template.entry (stays int, not guid)
ALTER TABLE `pool_members`
  MODIFY COLUMN `spawnId` BIGINT UNSIGNED NOT NULL;

-- spawn_group: references creature.guid or gameobject.guid
ALTER TABLE `spawn_group`
  MODIFY COLUMN `spawnId` BIGINT UNSIGNED NOT NULL;

-- transports: primary key guid (AUTO_INCREMENT, transport GUID)
ALTER TABLE `transports`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT;

-- vehicle_accessory: references creature.guid (the vehicle base)
ALTER TABLE `vehicle_accessory`
  MODIFY COLUMN `guid` BIGINT UNSIGNED NOT NULL DEFAULT '0';

-- waypoint_data: id column is a creature spawn GUID (FK to creature.guid)
ALTER TABLE `waypoint_data`
  MODIFY COLUMN `id` BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Creature GUID';
