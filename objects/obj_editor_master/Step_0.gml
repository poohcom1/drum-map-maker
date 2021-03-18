/// @description 

global.track_pos = audio_sound_get_track_position(global.song_id);

var display_offset = 275 - ms_offset;

// Nagivation
if (keyboard_check_pressed(ord("A"))) {
	if (global.measure > 1)
		if (audio_is_paused(global.song_id)) {
		
			if (floor(global.track_pos) == floor(global.measure_ms[global.measure - 1]/1000)) {
				audio_sound_set_track_position(global.song_id, global.measure_ms[global.measure-2]/1000);
			}
			else 
				audio_sound_set_track_position(global.song_id, global.measure_ms[global.measure-1]/1000);
		}
		else if (global.measure_beat <= global.beat_count/2)
			audio_sound_set_track_position(global.song_id, global.measure_ms[global.measure-2]/1000);
		else 
			audio_sound_set_track_position(global.song_id, global.measure_ms[global.measure-1]/1000);
} else if (keyboard_check_pressed(ord("D"))) {
	if (global.measure < array_length(global.measure_ms) - 1)
		if (global.measure_beat >= global.beat_count)
			audio_sound_set_track_position(global.song_id, global.measure_ms[global.measure + 1]/1000);
		else
			audio_sound_set_track_position(global.song_id, global.measure_ms[global.measure]/1000);
}

/// @description 

var pos = global.track_pos * 1000 + ms_offset

global.beat = (pos + display_offset)/ms_per_beat + beat_offset;


if (global.sub_beat > pre_beat) {
	on_beat = true;
} else {
	on_beat = false;
}

pre_beat = global.sub_beat

global.measure = floor(global.beat/global.beat_count)
global.measure_beat = ceil(global.beat mod global.beat_count)
global.measure_sub = floor(global.sub_beat mod (global.sub_div))

global.sub_beat = floor(pos/ms_per_subbeat) + beat_offset*(global.sub_div/global.beat_count)



// Play 
if (audio_is_paused(global.song_id)) 
	return;

if (global.sub_beat >= array_length_2d(global.note_matrix, 0) || global.sub_beat < 0)
	return;
	
if (!on_beat)
	return;


for (var i = 0; i < 8; i++) {
	if (global.note_matrix[i, global.sub_beat] == 1) {
	
	switch (i) {
		case 0: audio_play_sound(snd_kick0, 100, false); break;
		case 1: audio_play_sound(snd_snare_acoustic, 100, false); break;
		case 2: audio_play_sound(snd_hat_closed0, 100, false); audio_pause_sound(snd_hat_open0); break;
		case 3: audio_play_sound(snd_hat_open0, 100, false); break;
		case 4: audio_play_sound(snd_crash0, 100, false); break;
		}
	}
}
