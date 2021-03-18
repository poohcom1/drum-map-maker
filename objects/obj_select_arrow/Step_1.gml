/// @description Insert description here
// You can write your code in this editor

on_click = false;

if (mouse_check_button_pressed(mb_left) && mouse_col()) {
	on_click = true;
}

if (mouse_check_button(mb_left) && mouse_col()) {
	timer++;
} else {
	timer = 0;	
}

if (timer > time_max && timer mod 4 == 0) {
	on_click = true;	
}

if (mouse_check_button_released(mb_left) && mouse_col()) {
	timer = 0
	
	with(obj_editor_master)
		track_init();
		
	with(obj_scroller)
		scroller_init();
}
