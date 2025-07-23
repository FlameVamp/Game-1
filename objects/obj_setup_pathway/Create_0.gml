
//create grid
grid = mp_grid_create(0, 0, room_width/16, room_height/16, 16, 16)

//non dark spots
light_list = ds_map_create()

if ds_map_find_value(light_list, obj_player.x/16) == undefined
	{ds_map_add(light_list, obj_player.x/16, [obj_player.y/16])}
else if !array_contains(ds_map_find_value(light_list, obj_player.x/16), obj_player.y/16)
	{ds_map_add(light_list, obj_player.x/16, [obj_player.y/16])}

function repath()
	{
	mp_grid_clear_all(grid)
	mp_grid_add_instances(grid, obj_wall_parent, 0)
	mp_grid_add_instances(grid, obj_pushable_parent, 0)
	for (var i = 0; i < instance_number(obj_door); i++)
		{
		var door = instance_find(obj_door, i)
		if !door.unlocked
			{mp_grid_add_instances(grid, door, 0)}
		}
	}
	
		
function list_light()
	{
	var lightLength = ds_map_size(light_list)
	for (var k = ds_map_find_first(light_list); !is_undefined(k); k = ds_map_find_next(light_list, k))
		{
		var v = light_list[? k]
		
		var map_list = ds_map_find_value(light_list, k + 1)
		for (var i = 0; i < array_length(v); i++)
			{
			if mp_grid_get_cell(grid, k + 1, v[i]) == 0
				{
				if map_list == undefined
					{ds_map_add(light_list, k + 1, [v[i]])}
				else if !array_contains(ds_map_find_value(light_list, k + 1), v[i])
					{array_push(map_list, v[i]); ds_map_replace(light_list, k + 1, map_list)}
				}
		
			var map_list = ds_map_find_value(light_list, k)
			if mp_grid_get_cell(grid, k, v[i] + 1) == 0
				{
				if map_list == undefined
					{ds_map_add(light_list, k, [v[i] + 1])}
				else if !array_contains(ds_map_find_value(light_list, k), v[i] + 1)
					{array_push(map_list, v[i] + 1); ds_map_replace(light_list, k, map_list)}
				}
		
		
			var map_list = ds_map_find_value(light_list, k - 1)
			if mp_grid_get_cell(grid, k - 1, v[i]) == 0
				{
				if map_list == undefined
					{ds_map_add(light_list, k - 1, [v[i]])}
				else if array_contains(ds_map_find_value(light_list, k - 1), v[i])
					{array_push(map_list, v[i]); ds_map_replace(light_list, k - 1, map_list)}
				}
		
			var map_list = ds_map_find_value(light_list, k)
			if mp_grid_get_cell(grid, k, v[i] - 1) == 0
				{
				if map_list == undefined
					{ds_map_add(light_list, k, [v[i] - 1])}
				else if !array_contains(ds_map_find_value(light_list, k), v[i] - 1)
					{array_push(map_list, v[i] - 1); ds_map_replace(light_list, k, map_list)}
				}
			}
		}
	if lightLength != ds_map_size(light_list)
		{}
	}