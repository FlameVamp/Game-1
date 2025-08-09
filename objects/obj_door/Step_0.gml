//unlocking with connected activator object
if unlocker == undefined {show_error("unlocker not defined", true)}
if !is_array(unlocker) {show_error("unlocker not of type 'array'", true)}

var count = 0
var unlock = true
for (var i = 0; i < array_length(unlocker); i++)
	{
	if array_contains(unlocker[i].negative, id)
		{
		if !unlocker[i].pressed {count += 1}
		else {unlock = false}
		}
	else
		{
		if unlocker[i].pressed {count += 1}
		else {unlock = false}
		}
	}

unlocked = unlock

if unlocked
	{image_index = unlocker_count; sprite_set_bbox(sprite_index, 0, 0, 0, 0); obj_setup_pathway.repath(); if array_contains(global.wall_list, self.id) {array_delete(global.wall_list, array_get_index(global.wall_list, self.id), 1)}}
else
	{image_index = count; sprite_set_bbox_mode(sprite_index, bboxmode_automatic); obj_setup_pathway.repath(); if !array_contains(global.wall_list, self.id) {array_push(global.wall_list, self.id)}}
