//if not dead and within certain distance of player
if state != "dead" && distance_to_object(obj_player) < 500
	{
	global.visible_list = variable_clone(global.wall_list)
	array_push(global.visible_list, obj_chest)
	//look for player or enemy that is pathing within line of sight
	if target == undefined or instance_exists(target)
		{
		if !pathing or target.object_index == obj_web
			{
			for (var i = 0; i < instance_number(obj_enemy_parent); i++)
				{
				var notme = instance_find(obj_enemy_parent, i)
				if !asset_has_any_tag(notme.object_index, "container", asset_object) && distance_to_object(notme) < 100 && notme.pathing && notme.state != "dead" && !collision_line(x, y, notme.x, notme.y, global.visible_list, false, false) && notme.target.object_index != obj_web
					{
					pathing = true
					target = notme
					alarm[0] = 1
					break
					}
				}
			}
		}
	
	//if player is seen, target them
	if !collision_line(x, y, obj_player.x, obj_player.y, global.visible_list, false, false) && distance_to_object(obj_player) < 150 && target != obj_player
		{
		pathing = true
		target = obj_player
		alarm[0] = 1
		}
	}
//stop pathing if too far from player
else
	{pathing = false}

alarm_set(1, 15)