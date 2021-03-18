/// @description Insert description here
// You can write your code in this editor

event_inherited();

var _old_child_count = child_count;

if (is_selected && keyboard_check_pressed(ord("T"))) {
	is_triplet = !is_triplet;	
}

if (global.update) {
	
	if (is_triplet) {
		child_count = 3;
	} else {
		child_count = 4;
	}
	
	if (child_count != _old_child_count) {
		reset_children();
	}
}