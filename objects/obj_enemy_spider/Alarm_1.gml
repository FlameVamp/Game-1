
//don't do stuff if dead (obviously)
if state != "dead"
	{
	
	//if not at the home_web at the start, move there
	if !pathing && array_length(home_web) > 0 && !place_meeting(x, y, home_web[0])
		{
		pathing = true
		target = home_web[0]
		alarm[0] = 1
		}
	//if in the home web already this will run, moves to a random web within home web array
	else if !pathing && place_meeting(x, y, obj_web) && array_length(home_web) > 0
		{
		pathing = true
		target = findWeb()
		alarm[0] = 1
		}
	
	//if path not working, start timer
	if pathing && path_index == -1 && pathTimer == ogPathTimer && !pathTiming
		{pathTiming = true}
	else if pathTiming && path_index == -1
		{
		pathTimer--
		//when timer half done (or less), if still not working, look for a web in home web and move to it
		if pathTimer <= ogPathTimer - 5
			{pathing = true; target = findWeb() alarm[0] = 1}
		//when timer done if still not working and no webs able to path to, reset home web (find new one or make new one)
		if pathTimer <= 0
			{pathTiming = false; pathTimer = ogPathTimer; home_web = []; pathing = false; web_locations = undefined; firstRun++}
		}
	//if path starts working stop counting down and reset timer
	else if path_index != -1
		{pathTiming = false; pathTimer = ogPathTimer;}
	
	//home web expansion!
	var rand = irandom_range(0,100);
	var web_size = 100
	if instance_exists(target) && array_length(home_web) > 0
		{
		if place_meeting(x, y, obj_web) && (target.object_index == obj_web or !pathing)
			{
			if array_length(home_web) <= 6
				{
				web_size = array_length(home_web) * 15
				}
			else {web_size = 98}
			if rand > web_size
				{
				//checks a random web to see if it can be expanded upon, if not nothing happens
				var web = home_web[irandom(array_length(home_web) - 1)]
				if instance_exists(web)
					{
					var new_web = undefined
					var has_webs = []
					if !web.hasNorth {array_push(has_webs, "north")}
					if !web.hasEast {array_push(has_webs, "east")}
					if !web.hasSouth {array_push(has_webs, "south")}
					if !web.hasWest {array_push(has_webs, "west")}
					
					if array_length(has_webs) > 0
						{var web_i = irandom(array_length(has_webs) - 1)}
					else
						{var web_i = 0; has_webs[0] = -1}
					
					if has_webs[web_i] == "north"
						{
						if !position_meeting(web.x, web.y - 16, global.neighbor_list)
							{
							new_web = instance_create_layer(web.x, web.y - 16, "Instances", obj_web)
							array_push(home_web, new_web.id)
							}
						}
					else if has_webs[web_i] == "east"
						{
						if !position_meeting(web.x + 16, web.y, global.neighbor_list)
							{
							new_web = instance_create_layer(web.x + 16, web.y, "Instances", obj_web)
							array_push(home_web, new_web.id)
							}
						}
					else if has_webs[web_i] == "south"
						{
						if !position_meeting(web.x, web.y + 16, global.neighbor_list)
							{
							new_web = instance_create_layer(web.x, web.y + 16, "Instances", obj_web)
							array_push(home_web, new_web.id)
							}
						}
					else if has_webs[web_i] == "west"
						{
						if !position_meeting(web.x - 16, web.y, global.neighbor_list)
							{
							new_web = instance_create_layer(web.x - 16, web.y, "Instances", obj_web)
							array_push(home_web, new_web.id)
							}		
						}
					if new_web != undefined
						{
						with new_web
							{
							var nearest_web  = instance_nearest_notme(x, y, obj_web)
							if nearest_web != noone
								{
								if nearest_web.x == x && nearest_web.y == y
									{instance_destroy(self)}
								else 
									{
									event_perform(ev_step, 0)
									for (var i = 0; i < array_length(neighbors); i++)
										{
										if neighbors[i] != -1 && !array_contains(other.home_web, neighbors[i]) && neighbors[i].object_index != obj_wall
											{other.run()}
										}
									}
								}
							}
						}
					}
				}
			if pathing && path_position == 0
				{
				alarm[0] = -1; if path_exists(path) path_delete(path);
				target = findWeb()
				alarm[0] = 1
				}
			}
		}
	}

// Inherit the parent event
event_inherited();