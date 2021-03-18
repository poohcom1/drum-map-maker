/// @description 

// Inherit the parent event
event_inherited();

// Set up
width = room_width
height = sprite_height
view_type = TYPE.VERTICAL
child = obj_track
child_count = 8

h_margin = 15
v_margin = 25
margins = 0
h_offset = 60

instance_create_depth(x, y, depth - 50, obj_beat_marker);

create_children()

