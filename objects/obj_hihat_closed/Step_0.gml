/// @description Insert description here
// You can write your code in this editor

pressed = keyboard_check_pressed(key);

if (pressed) {
	audio_play_sound(sound, 100, false);
	audio_stop_sound(snd_hat_open0);
}