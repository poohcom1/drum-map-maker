/// @description Insert description here
// You can write your code in this editor

if (on_click) {
	var f = file_text_open_read(working_directory + file_name);
	
	
	obj_tempo.val = file_text_read_real(f);
	obj_offset.val = file_text_read_real(f);
	obj_editor_master.beat_offset = file_text_read_real(f);
	
	obj_editor_master.tempo = obj_tempo.val;
	obj_editor_master.ms_offset = obj_offset.val;
	obj_editor_master.beat_offset += 0;
	
	with (obj_editor_master) {
		track_init();
	}
		
	with (obj_scroller)
		scroller_init();
		
	show_debug_message(obj_editor_master.tempo);
	show_debug_message(obj_editor_master.ms_offset);
	show_debug_message(obj_editor_master.beat_offset);
	
	file_text_readln(f);

	
	for (var i = 0; i < array_length(global.note_matrix); i++) {
		var str = file_text_read_string(f);
		var pos = 1;
		
		var written = false;
		var beat = 0; // be beat
		
		//TO-DO change beat count from 4?
		
		for (var j = 0; j < array_length(global.note_matrix[0]); j += 4) {
			var hex = string_char_at(str, pos);
			pos++;
			
			var bin = string(hex_to_bin(hex));
			
			for (var k = 0; k < 4; k++) {
				global.note_matrix[i, j + k] = real(string_char_at(bin, k + 1));
				if (global.note_matrix[i, j + k] == 1)
					written = true;
			}
			
			if (written) {
				global.measure_written[floor(beat/4)] = true;
				written = false;
			}
			
			beat++;
		}
		
		file_text_readln(f);
	}
	
	file_text_close(f);

}