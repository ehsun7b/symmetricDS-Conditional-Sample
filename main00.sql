use hsync;

insert into sym_node (node_id, node_group_id, external_id, sync_enabled)
values
('00', 'main', '00', 1);

insert into sym_node_identity values ('00');

insert into sym_node_group
(node_group_id, description)
values
('main', 'Centeral registration nodes.'),
('pc', 'Normal PC group');

insert into sym_node_group_link
(source_node_group_id, target_node_group_id, data_event_action)
values
('pc', 'main', 'P'),
('main', 'pc', 'w'),
('pc', 'pc', 'w');

insert into sym_channel 
(channel_id, processing_order, max_batch_size, max_batch_to_send, 
extract_period_millis, batch_algorithm, enabled, description)
values
('channel1', 10, 1000, 10, 0, 'default', 1, 'All data from pc to main where age is less than 18'),
('channel2', 10, 1000, 10, 0, 'default', 1, 'data under 18 and equal to 18 from pc to main');

insert into sym_trigger
(trigger_id, source_table_name, channel_id, last_update_time, create_time)
values
('all_data', 'patient', 'channel1', current_timestamp, current_timestamp);

insert into sym_router
(router_id, source_node_group_id, target_node_group_id, create_time, last_update_time, router_type, router_expression, target_table_name)
values
('pc2main', 'pc', 'main', current_timestamp, current_timestamp, 'default', NULL, 'patient'),
('main2pc', 'main', 'pc', current_timestamp, current_timestamp, 'default', NULL, 'patient'),
('pc2pc', 'pc', 'pc', current_timestamp, current_timestamp, 'column', 'SYNC=all', 'patient');

insert into sym_trigger_router
(trigger_id, router_id, initial_load_order, create_time, last_update_time)
values
('all_data', 'pc2main', 1, current_timestamp, current_timestamp),
('all_data', 'main2pc', 1, current_timestamp, current_timestamp),
('all_data', 'pc2pc', 1, current_timestamp, current_timestamp);
