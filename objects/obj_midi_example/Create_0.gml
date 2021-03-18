//EXAMPLE: SCRIPT USAGE ---------------------------------------
/*
var sourcefile = get_open_filename("", "");
var midi = read_midi(sourcefile);
var notes = midi[0];
var events = midi[1];

var outputfile = file_text_open_write("decodedmidi.txt");

file_text_write_string(outputfile, "[NOTES]");
file_text_writeln(outputfile);
for(var i = 0; i < ds_list_size(notes); i++) {
	var note = ds_list_find_value(notes, i);
	file_text_write_string(outputfile, "start time: "+string(note[0]));
	file_text_write_string(outputfile, "; note number: "+string(note[1]));
	file_text_write_string(outputfile, "; note velocity: "+string(note[2]));
	file_text_write_string(outputfile, "; end time: "+string(note[3]));
	file_text_writeln(outputfile);
}

file_text_write_string(outputfile, "[EVENTS]");
file_text_writeln(outputfile);
for(var i = 0; i < ds_list_size(events); i++) {
	var event = ds_list_find_value(events, i);
	file_text_write_string(outputfile, "event time: "+string(event[0]));
	file_text_write_string(outputfile, "; event name: "+string(event[1]));
	file_text_write_string(outputfile, "; event data: "+string(event[2]));
	file_text_writeln(outputfile);
}

file_text_close(outputfile);

//EXAMPLE: SCRIPT USAGE (with raw on) ---------------------------------------

var sourcefile = get_open_filename("MIDI|*.mid", "");
var midi = read_midi(sourcefile, 1);
var notes = midi[0];
var events = midi[1];

var outputfile = file_text_open_write("rawdecodedmidi.txt");

file_text_write_string(outputfile, "[NOTES]");
file_text_writeln(outputfile);
for(var i = 0; i < ds_list_size(notes); i++) {
	var note = ds_list_find_value(notes, i);
	file_text_write_string(outputfile, "start time: "+string(note[0]));
	file_text_write_string(outputfile, "; note number: "+string(note[1]));
	file_text_write_string(outputfile, "; note velocity: "+string(note[2]));
	file_text_write_string(outputfile, "; end time: "+string(note[3]));
	file_text_writeln(outputfile);
}

file_text_write_string(outputfile, "[EVENTS]");
file_text_writeln(outputfile);
for(var i = 0; i < ds_list_size(events); i++) {
	var event = ds_list_find_value(events, i);
	file_text_write_string(outputfile, "event time: "+string(event[0]));
	file_text_write_string(outputfile, "; event status byte: "+string(event[1]));
	file_text_write_string(outputfile, "; event byte 1: "+string(event[2]));
	file_text_write_string(outputfile, "; event data: "+string(event[3]));
	file_text_writeln(outputfile);
}

file_text_close(outputfile);
*/

//EXAMPLE: PLAYING NOTES ---------------------------------------
/*
NOTE: this is a very basic and inefficient way of playing the midi file. 
The notes are not equally tempered and can sound off.
It doesn't follow bpm changes but rather uses the bpm specified by the first change.
It is advised to add individual sounds for each note instead of changing the pitch of one.
*/

var sourcefile = get_open_filename("MIDI|*.mid", "");
var midi = read_midi(sourcefile, 1);
noteslist = midi[0];
var events = midi[1];

var bpm = 300; //in case bpm is never declared
for(var i = 0; i < ds_list_size(events); i++) {
	var event = ds_list_find_value(events, i);
	if (event[1] == "bpm change") {
		bpm = event[2];
		break;
	}
}

time = 0;
realbpm = 4*bpm/room_speed; //4 is an arbitrary value
show_debug_overlay(1);
