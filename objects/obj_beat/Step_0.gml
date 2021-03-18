/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var measure = global.measure;

matrix_pos = self_id + parent_id.self_id*4 + (measure * global.sub_div);

if (!global.update) return;

state = global.note_matrix[parent_id.parent_id.self_id, matrix_pos];

if (mouse_check_button_pressed(mb_left) && state == 0 && mouse_col()) {
	set_on();
}
else if (mouse_check_button_pressed(mb_left) && state == 1 && mouse_col()) {
	set_off();
}
