/// @description Insert description here
// You can write your code in this editor

str_debug =    "Measure: " + string(global.measure);
str_debug += "\nBeat:    " + string(global.measure_beat);
str_debug += "\nSubbeat: " + string(global.sub_beat);

draw_text(x, y, str_debug);