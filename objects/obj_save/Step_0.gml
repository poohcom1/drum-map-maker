/// @description Insert description here
// You can write your code in this editor

if (on_click) {
	var f = file_text_open_write(working_directory + file_name);
	
	file_text_write_real(f, obj_editor_master.tempo);
	file_text_write_real(f, obj_editor_master.ms_offset);
	file_text_write_real(f, obj_editor_master.beat_offset);
	file_text_writeln(f)
	
	for (var i = 0; i < array_length(global.note_matrix); i++) {
		var str = "";
		
		for (var j = 0; j < array_length(global.note_matrix[0]); j += 4) {
			var bin = "";
			for (var k = 0; k < 4; k++) {
				bin += string(global.note_matrix[i, j + k]);	
			}
			
			str += bin_to_hex(bin);
		}
		
		file_text_write_string(f, str);
		file_text_writeln(f);
	}
	
	file_text_close(f);
}