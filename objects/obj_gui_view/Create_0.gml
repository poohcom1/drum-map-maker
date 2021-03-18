/// @description Set width, height, type, and child

parent_id = undefined
child_id = []

self_id = 0

enum TYPE {
	HORIZONTAL,
	VERTICAL
}

// Set up
width = 10
height = 10
view_type = TYPE.HORIZONTAL
child = undefined
child_count = 0

is_selected = false;

// Child set up
h_margin = 0
v_margin = 0
margins = 0
h_offset = 0
v_offset = 0

function reset_children() {
	for (var i = 0; i < array_length(child_id); i++) {
		instance_destroy(child_id[i]);	
	}
	
	create_children();
}

function create_children() {
	if (child == undefined) return;
	
	var _v = 1;
	var _h = 1;
	
	if (view_type = TYPE.HORIZONTAL) _v = 0;
	if (view_type = TYPE.VERTICAL) _h = 0;
	
	var _x = x + h_margin + h_offset
	var _y = y + v_margin + v_offset
	
	for (var i = 0; i < child_count; i++) {
		child_id[i] = instance_create_depth(_x, _y, depth - 1, child)
		
		with (child_id[i]) {
			self_id = i
			parent_id = other
			init()
		}
		
		_x = x + h_margin + h_offset + ((i + 1) * (margins + child_id[i].sprite_width)) * _h
		_y = y + v_margin + v_offset + ((i + 1) * (margins + child_id[i].sprite_height)) * _v
	}
}


function set_shape() {
	var _x = 0
	var _y = 0
	
	if (parent_id.view_type == TYPE.HORIZONTAL) {
		_x = (parent_id.sprite_width - parent_id.h_offset - parent_id.h_margin*2 - parent_id.margins*(parent_id.child_count-1))/parent_id.child_count
		_y = parent_id.sprite_height - parent_id.v_offset - parent_id.v_margin*2
	} else {
		_x = parent_id.sprite_width - parent_id.h_offset - parent_id.h_margin*2 
		
		_y = (parent_id.sprite_height - parent_id.v_offset - parent_id.v_margin*2 - parent_id.margins*(parent_id.child_count-1) )/parent_id.child_count
	}
	
	image_xscale = _x/sprite_width;
	image_yscale = _y/sprite_height;
}

has_init = false;

function init() {
	if (!has_init) {
		set_shape();
		create_children()
		has_init = true;
	}

}