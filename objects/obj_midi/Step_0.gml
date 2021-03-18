//EXAMPLE: PLAYING NOTES ---------------------------------------
time += realbpm;

for(var i = 0; i < ds_list_size(noteslist); i++) {
	var note = ds_list_find_value(noteslist, i);
	if (note[0] > time) {
		continue;
	} else {
		var n = note[1]
		
		
		switch (n) {
			case 35:
			case 36:
				audio_play_sound(snd_kick0, 100, false); break;
			case 48:
			case 75:
				audio_play_sound(snd_snare_acoustic, 100, false); break;
			case 42:
				audio_play_sound(snd_hat_closed0, 100, false); break;
			case 46:
				audio_play_sound(snd_hat_open0, 100, false); break;
		}
		
		ds_list_delete(noteslist, i);
	}
}
