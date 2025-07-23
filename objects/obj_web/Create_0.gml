depth = -1000
neighbors = array_create(0, -1)

global.neighbor_list = [
obj_web, obj_wall_parent
]

hasNorth = false
hasEast = false
hasSouth = false
hasWest = false

objX = x +8
objY = y +8

destroyed = false

hasUpdated = false

//initialize web
function start()
	{
	var inst = instance_position(objX, objY - 16, global.neighbor_list)
	if inst != noone
		{
		if !inst.destroyed
			{
			neighbors[0] = inst
			hasNorth = true
			}
		else
			{
			neighbors[0] = -1
			hasNorth = false
			}
		}
	else
		{
		neighbors[0] = -1
		hasNorth = false
		}
	inst = instance_position(objX + 16, objY, global.neighbor_list)
	if inst != noone
		{
		if !inst.destroyed
			{
			neighbors[1] = inst
			hasEast = true
			}
		else
			{
			neighbors[1] = -1
			hasEast = false
			}
		}
	else
		{
		neighbors[1] = -1
		hasEast = false
		}
	inst = instance_position(objX, objY + 16, global.neighbor_list)
	if inst != noone
		{
		if !inst.destroyed
			{
			neighbors[2] = inst
			hasSouth = true
			}
		else
			{
			neighbors[2] = -1
			hasSouth = false
			}
		}
	else
		{
		neighbors[2] = -1
		hasSouth = false
		}
	inst = instance_position(objX - 16, objY, global.neighbor_list)
	if inst != noone
		{
		if !inst.destroyed
			{
			neighbors[3] = inst
			hasWest = true
			}
		else
			{
			neighbors[3] = -1
			hasWest = false
			}
		}
	else
		{
		neighbors[3] = -1
		hasWest = false
		}
	
	//assigning self as neighbor to adjacent webs
	if neighbors[0] != -1 && neighbors[0].object_index == obj_web
		{neighbors[0].neighbors[2] = self; neighbors[0].hasSouth = true; neighbors[0].update()}
	if neighbors[1] != -1 && neighbors[1].object_index == obj_web
		{neighbors[1].neighbors[3] = self; neighbors[1].hasWest = true; neighbors[1].update()}
	if neighbors[2] != -1 && neighbors[2].object_index == obj_web
		{neighbors[2].neighbors[0] = self; neighbors[2].hasNorth = true; neighbors[2].update()}
	if neighbors[3] != -1 && neighbors[3].object_index == obj_web
		{neighbors[3].neighbors[1] = self; neighbors[3].hasEast = true; neighbors[3].update()}
	update()
	}

//removes itself from being neighbor of adjacent webs
function die()
	{
	if neighbors[0] != -1 && neighbors[0].object_index == obj_web
		{neighbors[0].neighbors[2] = -1; neighbors[0].hasSouth = false; neighbors[0].update()}
	if neighbors[1] != -1 && neighbors[1].object_index == obj_web
		{neighbors[1].neighbors[3] = -1; neighbors[1].hasWest = false; neighbors[1].update()}
	if neighbors[2] != -1 && neighbors[2].object_index == obj_web
		{neighbors[2].neighbors[0] = -1; neighbors[2].hasNorth = false; neighbors[2].update()}
	if neighbors[3] != -1 && neighbors[3].object_index == obj_web
		{neighbors[3].neighbors[1] = -1; neighbors[3].hasEast = false; neighbors[3].update()}
	}
	
//update sprite for web	
function update()
	{
	var old_sprite = sprite_index
	if !hasNorth && !hasEast && !hasSouth && !hasWest
		{sprite_index = spr_web}
	else if hasNorth && hasEast && hasSouth && hasWest
		{sprite_index = spr_web_middle}
	else if hasNorth && hasEast && !hasSouth && !hasWest
		{sprite_index = spr_web_bottom_left}
	else if hasNorth && hasEast && !hasSouth && hasWest
		{sprite_index = spr_web_bottom}
	else if hasNorth && !hasEast && !hasSouth && hasWest
		{sprite_index = spr_web_bottom_right}
	else if !hasNorth && hasEast && hasSouth && !hasWest
		{sprite_index = spr_web_top_left}
	else if !hasNorth && hasEast && hasSouth && hasWest
		{sprite_index = spr_web_top}
	else if !hasNorth && !hasEast && hasSouth && hasWest
		{sprite_index = spr_web_top_right}
	else if hasNorth && !hasEast && hasSouth && hasWest
		{sprite_index = spr_web_right}
	else if hasNorth && hasEast && hasSouth && !hasWest
		{sprite_index = spr_web_left}
	if sprite_index != old_sprite
		{
		for (var i = 0; i < array_length(neighbors); i++)
			{
			if neighbors[0] != -1 && neighbors[0] == obj_web
				{neighbors[i].update()}
			}
		}
	}