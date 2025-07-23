xspd = 0
yspd = 0

// Inherit the parent event
event_inherited()

//redoes path movement when entering or exiting web because move speed changes when that happens
if !onWeb && place_meeting(x, y, obj_web)
	{alarm[0] = -1; if path_exists(path) {path_delete(path)}; alarm[0] = 1}
else if onWeb && !place_meeting(x, y, obj_web)
	{alarm[0] = -1; if path_exists(path) {path_delete(path)}; alarm[0] = 1}

//if dead, go to the background
if array_contains(behavior_stack, "dead")
	{depth = 0;}

//if dead or not moving, set animation to 0
if array_contains(behavior_stack, "dead") or (prev_x == x && prev_y == y)
	{image_index = 0}

//if attack is cooling down, count down the cool down
if attackCooldown > 0
	{attackCooldown--}

//gui location for creating the loot menu
guix = (x - camera_get_view_x(view_camera[0]))*global.screenRatio
guiy = (y - camera_get_view_y(view_camera[0]))*global.screenRatio

//if dead, you're dead
if (state == "dead" or currHealth <= 0) && !array_contains(behavior_stack, "dead")
	{state = "dead"; behavior_stack[0] = "dead"}

//if you have a behavior, run it
if array_length(behavior_stack) > 0 
	{behavior_running = true}

//if running a behavior, run it
if behavior_running
	{
	if array_length(behavior_stack) > 0 
		{
		var current_behavior = behavior_stack[0]
		var result = execute_behavior(current_behavior)
		if result == "Success" or result == "Failed"
			{
			if current_behavior == "attack" {hit = []}
			array_delete(behavior_stack, 0, 1)
			}
		}
	if (array_length(behavior_stack) == 0) {
            behavior_running = false
			}
	}
	
//if done with path and targeting player and not yet attacking, attack
if pathing && path_position == 1 && !array_contains(behavior_stack, "attack") && target = obj_player && attackCooldown <= 0
		{array_push(behavior_stack, "attack"); attackX = target.x; attackY = target.y; targetDir = point_direction(x, y, attackX, attackY); }

//if touching pushable and the pushable is moving, move with it
if distance_to_object(obj_pushable_parent) <= 1 && !array_contains(behavior_stack, "dead")
	{
	xspd = instance_nearest(x, y, obj_pushable_parent).xspd; yspd = instance_nearest(x, y, obj_pushable_parent).yspd
	}

//if stuck, move away from walls and pushables until away	
if moveAway
	{
	var move_dir = point_direction(x, y, instance_nearest(x, y, obj_pushable_parent).x, instance_nearest(x, y, obj_pushable_parent).y)
	var opposite_direction = (move_dir + 180) mod 360;
	var newX = lengthdir_x(move_spd, opposite_direction)
	var newY = lengthdir_y(move_spd, opposite_direction)
	var num = 0
	
	var finished = false
	var number = 0
	while finished == false
		{
		if moving(newX, newY) {finished = true; break;}
		else
			{
			if number == 0 {newX = move_spd; newY = move_spd}
			else if number == 1 {newX = -move_spd; newY = -move_spd}
			else if number == 2 {newX = move_spd; newY = 0}
			else if number == 3 {newX = 0; newY = move_spd}
			else if number == 4 {newX = -move_spd; newY = 0}
			else if number == 5 {newX = 0; newY = -move_spd}
			else if number == 6 {newX = +move_spd; newY = -move_spd}
			else if number == 7 {newX = -move_spd; newY = +move_spd}
			else {finished = true; break;}
			number++
			}
		}
	}
	
x += xspd
y += yspd