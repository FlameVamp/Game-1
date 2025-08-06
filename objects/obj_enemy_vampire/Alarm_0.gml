
//pathing creation
if pathing && !array_contains(behavior_stack, "attack")
	{
	//start moveAway if you're not moving for too long
	if (prev_x == x or prev_y == y)
		{
		if position_meeting(x, y, global.wall_list)
			{moveAway = true}
		else
			{moveAway = false}
		}
	else
		{moveAway = false}
	
	if path_exists(path)
		{path_delete(path)}
	path = path_add()

	if instance_exists(target)
		{
		while position_meeting(target.x + target_rdm_x, target.y + target_rdm_y, global.wall_list)
			{target_rdm_x = random_range(-4, 4); target_rdm_y = random_range(-4, 4)}
		target_x = target.x + target_rdm_x
		target_y = target.y + target_rdm_y
		mp_grid_path(obj_setup_pathway.grid, path, x, y, target_x, target_y, 1)
		path_start(path, move_spd, path_action_stop, true)
		}
	prev_x = x
	prev_y = y
	alarm_set(0, 30)
	}