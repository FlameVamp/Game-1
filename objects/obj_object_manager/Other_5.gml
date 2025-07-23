if !rm_outside_main_visited && room == rm_outside_main
	{rm_outside_main_visited = true}
else if !rm_player_house_visited && room == rm_player_house
	{rm_player_house_visited = true}
	
var obj_list = []

//save instances that need to be saved to obj list
with(all)
	{
	if instance_exists(self) && (object_is_ancestor(object_index, obj_enemy_parent) or object_index == obj_web or object_index == obj_box)
	&& object_index != obj_player && object_index != obj_door_in 
	&& object_index != obj_door_out && !object_is_ancestor(object_index, obj_item_parent)
		{
		var list = []
		list[0] = object_index
		list[1] = x
		list[2] = y
		if asset_has_any_tag(object_index, "container", asset_object)
			{
			list[3] = inventory
			}
		else if object_is_ancestor(object_index, obj_enemy_parent) && !asset_has_any_tag(object_index, "container", asset_object)
			{
			list[3] = inventory
			list[4] = currHealth
			list[5] = []
			for (var i = 0; i < array_length(home_web); i++)
				{
				if instance_exists(home_web[i])
					{array_push(list[5], [home_web[i].x, home_web[i].y])}
				}
			if currHealth > 0
				{
				list[6] = level
				list[7] = attributes
				list[8] = skills
				}
				
			}
		array_push(obj_list, list)
		}
	}

//save obj list to room that just ended
switch room
	{
	case rm_outside_main:
		rm_outside_main_objects = obj_list
		break;
	case rm_player_house:
		rm_player_house_objects = obj_list
		break;
	}