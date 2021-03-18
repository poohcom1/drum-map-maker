/// @description 

do_metronome = true;

do_use_song_track = true;

tempo = 123.1

var tempo_offset = 395
var beat_offset = -16 * 9 + 4

beat_count = 4

swing = 0


// Time calculation
ms_per_beat = 60000/tempo
sub_div = 16
ms_per_subbeat = 60000/tempo/(sub_div/beat_count)

song_id = audio_play_sound(mus_groovy, 100, false)

ms = 0
ms0 = 0

beat = 0
sub_beat = beat_offset

delta = tempo_offset

measure = 0
//TO-DO might have to change this to sync
measure_beat = (abs(beat_offset) mod sub_div) / 4 - 1

on_new_measure = false;

time = 0;
realbpm = 1/room_speed * 1000;



// File handling
notes = read_file(working_directory+"hello_world.txt")
