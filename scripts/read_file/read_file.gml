// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro KICK 0
#macro SNAR 1
#macro HAT_C 2

function read_file(file_name){
	var file = file_text_open_read(file_name);
	
	var len = real(file_text_readln(file))
	
	var notes = [];
	var cnt = 0;
	
	for (var i = 0; i < len; i++) {
		var text = file_text_read_string(file); file_text_readln(file);
		
		if (string_lettersdigits(text) == "" || string_char_at(text, 1) == "/") continue;
		
		
		// KICK
		for (var j = 0; j < string_length(text); j++) {
			bin = hex_to_bin(string_char_at(text, j+1));
			notes[j, cnt] = string_char_at(bin, 1)
			notes[j, cnt+1] = string_char_at(bin, 2)
			notes[j, cnt+2] = string_char_at(bin, 3)
			notes[j, cnt+3] = string_char_at(bin, 4)
		}
		cnt += 4
	}
	
	
	
	return notes
}