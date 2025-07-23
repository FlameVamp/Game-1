// Inherit the parent event
event_inherited();

//once random web has been reached, new random web target is picked from the home web
if instance_exists(target)
	{
	if array_length(home_web) > 0 && target.object_index == obj_web && path_position == 1
		{
		alarm[0] = -1; if path_exists(path) {path_delete(path)};
		target = findWeb()
		alarm[0] = 1
		}
	}
//initializes home web, in step event to let all webs be created and initialized first
if firstRun != 0 && array_length(home_web) == 0
	{
	//if this room hasn't been loaded before
	if web_locations == undefined
		{
		//checks for line of sight with the closest web, if no LOS then create one at self
		var web = instance_nearest(x, y, obj_web)
		if distance_to_object(web) < 200 && !collision_line(x, y, web.x, web.y, global.visible_list, false, false)
			{
			array_push(home_web, web.id)
			run(); firstRun--
			}
		else
			{
			array_push(home_web, instance_create_layer(x, y, "Instances", obj_web).id)
			run(); firstRun--
			}
		}
	//if room has been loaded before
	else if array_length(web_locations) > 0
		{
		for (var i = 0; i < array_length(web_locations); i++)
			{
			if position_meeting(web_locations[i][0], web_locations[i][1], obj_web)
				{
				array_push(home_web, instance_nearest(web_locations[i][0], web_locations[i][1], obj_web).id)
				}
			}
		firstRun--
		}
	else {firstRun--}
	}

//if the home web is initialized (this might be leftover code but whatever)
else if array_length(home_web) > 0
	{
	firstRun--
	}