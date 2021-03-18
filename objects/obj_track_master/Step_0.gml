/// @description 

ms = audio_sound_get_track_position(song_id)*1000

if (do_use_song_track) realbpm = ms-ms0

delta += realbpm
time += realbpm

ms0 = audio_sound_get_track_position(song_id)*1000

//ms_per_subbeat = audio_sound_get_track_position(song_id)*1000/sub_div

if (delta >= ms_per_subbeat) {
	//show_debug_message(ms)	
	delta = delta - ms_per_subbeat;
	beat += 1/(sub_div/beat_count);
	measure_beat += 1/(sub_div/beat_count);
	sub_beat++
	
	if (beat mod 1 == 0 && do_metronome)
		audio_play_sound(snd_metronome, 100, false)
	
	if ((measure_beat + beat_count - 1) mod beat_count == 0) {
		measure++
		on_new_measure = true;
		measure_beat = 1
	}
}



if (sub_beat >= array_length_2d(notes, 0) || sub_beat < 0)
	return;

if (notes[0, sub_beat] == 1) {
	audio_play_sound(snd_kick0, 100, false)
	notes[0, sub_beat] = 0;
}


if (notes[1, sub_beat] == 1) {
	audio_play_sound(snd_snare_rock0, 100,false)
	notes[1, sub_beat] = 0;
}

if (notes[2, sub_beat] == 1) {
	audio_play_sound(snd_hat_closed0, 100, false)
	notes[2, sub_beat] = 0;
}
