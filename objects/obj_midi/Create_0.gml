
var sourcefile = get_open_filename("MIDI|*.mid", "");
var midi = read_midi(sourcefile, 1);
noteslist = midi[0];
var events = midi[1];

var bpm = 130; //in case bpm is never declared
for(var i = 0; i < ds_list_size(events); i++) {
	var event = ds_list_find_value(events, i);
	if (event[1] == "bpm change") {
		bpm = event[2];
		break;
	}
}

time = 0;
realbpm = 2*bpm/room_speed; //4 is an arbitrary value
show_debug_overlay(1);
