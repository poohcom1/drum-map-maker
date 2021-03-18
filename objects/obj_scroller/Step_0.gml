/// @description Insert description here
// You can write your code in this editor

slider_percent = (id_slider.x - x)/(sprite_width)
var pos  = other.slider_percent * obj_editor_master.song_length


var col = mouse_col()

with (id_slider) {
	if (mouse_check_button_released(mb_left) || (!col && mouse_check_button(mb_left) && mouse_on = true)) {
		audio_sound_set_track_position(global.song_id, pos)
		mouse_on = false
	}
	else if (mouse_check_button(mb_left) && col) {
		x = clamp(mouse_x, other.x, other.x + other.sprite_width)
		mouse_on = true
	} else {
		var pos = audio_sound_get_track_position(global.song_id)/obj_editor_master.song_length
		x = other.x + pos * other.sprite_width	
		mouse_on = false
	}
}
