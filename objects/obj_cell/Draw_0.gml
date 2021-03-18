/// @description Insert description here
// You can write your code in this editor

event_inherited();

draw_self();

if (parent_id.self_id == 0 && global.measure_beat == self_id + 1) {
	obj_beat_marker.x = x - parent_id.margins/2 - 2;
}