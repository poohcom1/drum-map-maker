/// @description Insert description here
// You can write your code in this editor

if ((mouse_check_button_pressed(mb_left) && mouse_col()) || keyboard_check_pressed(vk_space)) && state == 0 {
	state = 1
}
else if ((mouse_check_button_pressed(mb_left) && mouse_col()) || keyboard_check_pressed(vk_space)) && state == 1 state = 0

if (audio_sound_get_track_position(global.song_id) == audio_sound_length(global.song_id) 
	&& (mouse_check_button_pressed(mb_left) && mouse_col() || keyboard_check_pressed(vk_space))
	) {
	audio_sound_set_track_position(global.song_id, 0);
	state = 1;
}

if (state == 0) {
	audio_resume_sound(global.song_id)	
} else {
	audio_pause_sound(global.song_id)
}
