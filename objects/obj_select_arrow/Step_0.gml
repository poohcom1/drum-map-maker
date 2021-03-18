/// @description

if (on_click) {
	if (self_id == 1 && parent_id.val < parent_id.max_value) {
		parent_id.val++;
	} else if (self_id == 0 && parent_id.val > parent_id.min_value) {
		parent_id.val--;
	}
}
