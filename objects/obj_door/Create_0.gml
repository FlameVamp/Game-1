unlocked = false

global.locked_door_list = []

unlocker_count = 1
if array_length(unlocker) == 2
	{sprite_index = spr_door_2; unlocker_count = 2}
else if array_length(unlocker) == 3
	{sprite_index = spr_door_3; unlocker_count = 3}
else if array_length(unlocker) == 4
	{sprite_index = spr_door_4; unlocker_count = 4}
else if array_length(unlocker) > 4
	{show_error("more than 4 unlockers cannot be assigned to one unlockee", true)}