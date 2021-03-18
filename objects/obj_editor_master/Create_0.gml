/// @description 



// song matrix

global.note_matrix = []
global.triplet_matrix = []

//TO-DO find max length
for (var i = 0; i < 8; i++) {
	for (var j = 0; j < 8000; j++) {
		global.note_matrix[i , j] = 0;
		global.triplet_matrix[i,j] = 0;
	}
}


song = mus_groovy

global.song_id = audio_play_sound(song, 100, true)

global.file = audio_get_name(song)

song_length = audio_sound_length(global.song_id)

str_debug = ""

// track info
do_metronome=false

ms_offset = 0

tempo = 120

beat_offset = 2

global.beat_count = 4

global.swing = 0

ms = 0
ms0 = 0

global.measure = 0
global.beat = 0
global.sub_beat = 0
global.measure_beat = 0


on_new_measure = false;

time = 0;
realbpm = 1/room_speed * 1000;

// Scroller
global.track_pos = 0 //for scroller change only

// check beat
on_beat = false;
pre_beat = 0;

// Functions
global.update = false;



function track_init() {
	global.sub_div = global.beat_count * 4
	global.sub_div_t = global.beat_count * 6
	
	// Time calculation
	ms_per_beat = 60000/tempo
	ms_per_subbeat = 60000/tempo/(global.sub_div/global.beat_count)
	
	//TO-DO might have to change this to sync
	global.measure_beat = (abs(beat_offset) mod global.sub_div) / 4 - 1
	global.sub_beat = (abs(beat_offset)) / 4 - 1


	// measure positions
	global.measure_ms = []
	var cnt = 0
	var p = ms_offset + beat_offset*ms_per_beat

	while (true) {
		global.measure_ms[cnt] = p;
		p += ms_per_beat*global.beat_count;
		cnt++;
	
		if (p > audio_sound_length(global.song_id) * 1000) 
			break;
	}
}

track_init();