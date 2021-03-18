/// @description Check click

on_click = false;
if (!global.update) return;

if (mouse_check_button_pressed(mb_left) && mouse_col()) {
	on_click = true;
}
