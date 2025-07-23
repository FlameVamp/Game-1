//unlocking with connected activator object
if unlocker == undefined {show_error("unlocker not defined", true)}
else if unlocker.pressed {unlocked = true}
else {unlocked = false}


if unlocked
	{image_index = 1; sprite_set_bbox(sprite_index, 0, 0, 0, 0); obj_setup_pathway.repath(); if array_contains(global.wall_list, self.id) {array_delete(global.wall_list, array_get_index(global.wall_list, self.id), 1)}}
else
	{image_index = 0; sprite_set_bbox_mode(sprite_index, bboxmode_automatic); obj_setup_pathway.repath(); if !array_contains(global.wall_list, self.id) {array_push(global.wall_list, self.id)}}
