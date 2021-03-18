/// @description 

val = 1;
field_name = ""
min_value = 1;
max_value = 64;

with (instance_create_depth(x + sprite_width*1/3, y, depth-1, obj_select_arrow)) {
	self_id = 0;	
	parent_id = other;
	image_xscale = -1 * other.sprite_height/sprite_width;
	image_yscale = other.sprite_height/sprite_height;
}

with (instance_create_depth(x + sprite_width*2/3, y,  depth-1, obj_select_arrow)) {
	self_id = 1;	
	parent_id = other;
	image_xscale = other.sprite_height/sprite_width;
	image_yscale = other.sprite_height/sprite_height;
}