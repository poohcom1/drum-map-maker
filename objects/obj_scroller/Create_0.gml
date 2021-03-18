/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


id_slider = instance_create_layer(x, y + 15, "GUI", obj_slider);
id_slider.depth = depth - 15

slider_percent = 0
track_pos = 0

mouse_on = false


function scroller_init() {
	with (obj_scroll_bar) {
		instance_destroy();	
	}

	for (var i = 0; i < array_length(global.measure_ms); i++) {
		var _x = x + sprite_width * (global.measure_ms[i]/(audio_sound_length(global.song_id)*1000))
		instance_create_depth(_x, y, depth-1, obj_scroll_bar);	
	}

}

scroller_init();

global.measure_written = [];

for (var i = 0; i < array_length(global.measure_ms) + 1; i++) {
		global.measure_written[i] = 0
}