/// @description Insert description here
// You can write your code in this editor

if (on_click) {
	var i;
	for (i = 0; i < instance_number(obj_beat); i += 1)
	   {
			with (instance_find(obj_beat,i)) {
				set_off();
			}
	   }
}
