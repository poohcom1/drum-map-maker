/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = 0;
matrix_pos = 0;

function set_on() {
	state = true;
	global.note_matrix[parent_id.parent_id.self_id, matrix_pos] = state;
	
	global.measure_written[global.measure] = true;
}

function set_off() {
	state = false;
	global.note_matrix[parent_id.parent_id.self_id, matrix_pos] = state;
	
	var written = false;
	for (var i = 0; i < instance_number(obj_beat); i += 1)
    {
		with (instance_find(obj_beat, i)) {
			written = written || state;
		}
    }
	
	if (!written) {
		global.measure_written[global.measure] = false;
	}
}