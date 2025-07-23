//knockback behavior
function knockback_behavior()
	{
	if array_contains(behavior_stack, "dead")
		{return "Failed"}
	if alarm[0] != -1
		{alarm[0] = -1; path_start(path, 0, path_action_stop, false); if path_exists(path) {path_delete(path)}}
	var opposite_direction = (hitDirection + 180) mod 360;
	var newX = lengthdir_x(knockbackSpeed, opposite_direction)
	var newY = lengthdir_y(knockbackSpeed, opposite_direction)
	
	if !place_meeting(x + newX, y + newY, global.wall_list) 
		{
		x += newX
		y += newY
		}
	else
		{
		knockbackTime = 0
		}
		
	knockbackTime --
	if knockbackTime <= 0
		{
		knockbackTime = ogKnockbackTime
		array_insert(behavior_stack, 1, "stunned")
		return "Success"
		}	
	return "Progress"
	}