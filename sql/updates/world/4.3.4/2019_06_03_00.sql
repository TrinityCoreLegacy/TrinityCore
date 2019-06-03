--
DELETE FROM `spell_script_names` WHERE `spell_id` IN (86748,86783,95747,82721,86848,82315,84301,86960);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(86748, 'spell_initialize_uldum_intro'),
(86783, 'spell_reverse_cast_mirror_image'),
(95747, 'spell_uldum_player_summon_camera'),
(82721, 'spell_reverse_cast_ride_demon_creator'),
(86848, 'spell_master_ping_all_actors'),
(82315, 'spell_reverse_cast_ride_seat_2'),
(84301, 'spell_reverse_cast_ride_camera_bunny_seat_3'),
(86960, 'spell_master_summon_beam_target_02');
