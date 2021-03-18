/// @description Insert description here
// You can write your code in this editor

measures = 1;

for (var i = 0; i < instance_number(obj_select); i++) {
	if (instance_find(obj_select, i).field_name == "Copy") {
		measures =	instance_find(obj_select, i).val;
	}
}

if (on_click) {
	
	for (var m = 0; m < measures; m++) {
		var written = false;
		var sub_beat = global.measure * global.sub_div + m * global.sub_div
		
		for (var i = 0; i < array_length(global.note_matrix); i++) {
			var next = measures*global.sub_div;
		
			for (var j = 0; j < global.sub_div; j++) {
				global.note_matrix[i, sub_beat + j + next] = global.note_matrix[i, sub_beat + j];
				written = written || global.note_matrix[i, sub_beat + j];
				
			}
		}

		global.measure_written[global.measure + measures + m] = written;
	}
}


