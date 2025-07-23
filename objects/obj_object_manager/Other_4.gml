var obj_list = undefined

//load obj list from room that is entering
switch room
	{
	case rm_outside_main:
		if rm_outside_main_visited
			{
			var obj_list = rm_outside_main_objects
			}
		break;

	case rm_player_house:
		if rm_player_house_visited
			{
			var obj_list = rm_player_house_objects
			}
		break;
	}
if obj_list != undefined
	{
	//destroy all instances that would get saved
	with(all)
		{
		if instance_exists(self) && (object_is_ancestor(object_index, obj_enemy_parent) or object_index == obj_web or object_index == obj_box)
		&& object_index != obj_player && object_index != obj_door_in 
		&& object_index != obj_door_out && !object_is_ancestor(object_index, obj_item_parent)
			{
			instance_destroy(self)
			}
		}
	//load instances from obj list
	for (var i = 0; i < array_length(obj_list); i++)
		{
		var instance = instance_create_layer(obj_list[i][1], obj_list[i][2], "Instances", obj_list[i][0])
		if asset_has_any_tag(instance.object_index, "container", asset_object) or object_is_ancestor(instance.object_index, obj_enemy_parent)
			{
			instance.inventory = obj_list[i][3]
			}
		if object_is_ancestor(instance.object_index, obj_enemy_parent) && array_length(obj_list[i]) > 4
			{
			instance.currHealth = obj_list[i][4]
			instance.web_locations = obj_list[i][5]
			if instance.currHealth > 0
				{
				instance.level = obj_list[i][6]
				instance.attributes = obj_list[i][7]
				instance.skills = obj_list[i][8]
				}
			}
		}
	}