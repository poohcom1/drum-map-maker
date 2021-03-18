/// @description Insert description here
// You can write your code in this editor

draw_self()
//draw_text(x,y + 15, current_measure)
var _x1 = 0;
var _x2 = 0;


for (var i = 0; i < array_length(global.measure_ms) + 1; i++) {
	// skip last measure since it will exceed the array length as well as the scroller width
	
	draw_set_color(c_white);
	
	if (i != array_length(global.measure_ms)) {
		_x1 = x + sprite_width * (global.measure_ms[i]/(audio_sound_length(global.song_id)*1000))
	}
	
	if (i == 0)
		_x1 = x
	else
		_x1 = x + sprite_width * (global.measure_ms[i - 1]/(audio_sound_length(global.song_id)*1000))
	
	if (i < array_length(global.measure_ms))
		_x2 = x + sprite_width * (global.measure_ms[i]/(audio_sound_length(global.song_id)*1000));
	else
		_x2 = x + sprite_width;
	
	if (global.measure_written[i]) {
		draw_rectangle(_x1, y, _x2, y + sprite_height, false);
	}
}

i = global.measure

if (i != array_length(global.measure_ms)) {
	_x1 = x + sprite_width * (global.measure_ms[i]/(audio_sound_length(global.song_id)*1000))
}

if (i == 0)
	_x1 = x
else
	_x1 = x + sprite_width * (global.measure_ms[i - 1]/(audio_sound_length(global.song_id)*1000))



if (i + obj_copy.measures - 1 < array_length(global.measure_ms))
	_x2 = x + sprite_width*(global.measure_ms[i - 1 + obj_copy.measures]/(audio_sound_length(global.song_id)*1000));
else
	_x2 = x + sprite_width;
		
draw_set_color(c_red);
draw_rectangle(_x1, y, _x2, y + sprite_height, true);

draw_set_color(c_white);