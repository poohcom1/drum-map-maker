// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouse_col(){
	
	if (mouse_x > bbox_left && mouse_x < bbox_right && mouse_y > bbox_top && mouse_y < bbox_bottom) 
		return true
	else
		return false
}