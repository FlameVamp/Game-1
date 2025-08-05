var right_key = keyboard_check(ord("D"));
var left_key = keyboard_check(ord("A"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));
var sprint_key = keyboard_check(vk_lcontrol);
var dash_key = keyboard_check(vk_lshift);
var left_click = mouse_check_button_pressed(mb_left)

if !pause
	{

	//death - temporary for now
	if state == "dead"
		{
		game_restart()
		}
		
	//weapon swing
	if instance_exists(equippedItem) && left_click && equippedItem.type == "Weapon" && !swing && !swingCooling
		{
		swing = true
		startingStamina = currStamina
		if currStamina >= 0
			{currStamina -= 6}
		else
			{currStamina = 0;}
		var slashAngle = angle + 225
		var slashX = x + 16
		var slashY = y - 16
		switch face
			{
			case UP: angle += 45; angleMod += 45; slashAngle = angle - 90; slashX = x; slashY = y - 28;
						break;
			case DOWN: angle += -135; angleMod += -135; slashAngle = angle - 90; slashX = x; slashY = y + 12;
						break;
			case LEFT: angle += 135; angleMod += 135; slashAngle = angle - 90; slashX = x - 16; slashY = y - 16;
						break;
			}
		}

	if swing && equippedItem.type == "Weapon"
		{
		equippedItem.visible = true
		equippedItem.x = self.x
		equippedItem.y = self.y - 8
		equippedItem.image_angle = angle
		equippedItem.depth = depth - 1
		equippedItem.image_xscale = 1
		equippedItem.image_yscale = 1
		staminaCooling = true
		if !instance_exists(obj_slash)
			{
			var slash = instance_create_layer(0, 0, "items", obj_slash)
			slash.visible = true
			slash.x = slashX
			slash.y = slashY
			slash.image_xscale = .5
			slash.image_yscale = .5
			slash.image_angle = slashAngle
			slash.depth = depth + 1
			}
		if angle >= angleMod
			{
			if startingStamina > 0 
				{angle -= 15}
			else
				{angle -= 5}
			}
		else
			{angle = ogAngle; swing = false; array_resize(equippedItem.hit, 0); angleMod = ogAngleMod; 
			equippedItem.visible = false; equippedItem.x = -100; equippedItem.y = -100; instance_destroy(obj_slash)
			swingCooling = true}
		}
	//swing cooldown
	if swingCooling
		{
		swingCooldown--
		if swingCooldown <= 0
			{
			swingCooling = false
			swingCooldown = ogSwingCooldown
			}
		}
	//looting
	if lootMenu != undefined && lootMenuOwner != undefined && !place_meeting(x, y, lootMenuOwner)
		{
		lootMenu.inventory = undefined
		lootMenu.items_x = 0
		lootMenu.items_y = 0
		if asset_has_any_tag(lootMenuOwner.object_index, "container", asset_object)
			{lootMenuOwner.open = false}
		}

	//stamina regen
	if not sprint_key and not dashing and not dashed and not staminaCooling and not swing
		currStamina = min(currStamina + staminaRegen, maxStamina);
	
	//magicka regen
		currMagicka = min(currMagicka + magickaRegen, maxMagicka);

	xspd = (right_key - left_key) * move_spd;

	yspd = (down_key - up_key) * move_spd;



	//sprint
	if sprint_key and currStamina > 0 and not dashing and not swing
		{
		sprinting = true
		if xspd > 0
			{
			xspd += sprintSpeed
			currStamina -= sprintCost
			}
		else if xspd < 0
			{
			xspd -= sprintSpeed
			currStamina -= sprintCost
			}
		else if yspd > 0
			{
			yspd += sprintSpeed
			currStamina -= sprintCost
			}
		else if yspd < 0
			{
			yspd -= sprintSpeed
			currStamina -= sprintCost
			}
		}
	
	//sprint cooldown (cooldown for stamina regen)
	if sprinting and not sprint_key and not swing
		{
		sprinting = false
		staminaCooling = true
		}
	

	
	//dash
	if dash_key and currStamina >= dashCost and not dashing and not dashed and not swing
		{
		currStamina -= dashCost
		dashing = true
		if xspd > 0
			{
			dashX = dashSpeed
			}
		else if xspd < 0
			{
			dashX = -dashSpeed
			}
		if yspd > 0
			{
			dashY = dashSpeed
			}
		else if yspd < 0
			{
			dashY = -dashSpeed
			}
		if (xspd == 0) and (yspd == 0)
			{
			switch face
				{
				case UP: dashY = -dashSpeed
						 break;
				case DOWN: dashY = dashSpeed
						   break;
				case LEFT: dashX = -dashSpeed
						   break;
				case RIGHT: dashX = dashSpeed
							break;
				}
			}
		xspd = dashX
		yspd = dashY
		}
	
	if dashing
		{
		dashDuration -= 1
		if dashDuration == 0
			{
			dashDuration = ogDashDuration
			dashing = false
			dashX = 0
			dashY = 0
			dashed = true
			staminaCooling = true
			}
		else
			{
			xspd = dashX
			yspd = dashY
			}
		}
	
	//stamina cooldown
	if staminaCooling
		{
		staminaCooldown--
		if staminaCooldown <= 0
			{
			staminaCooling = false
			staminaCooldown = ogStaminaCooldown
			if dashed
				{dashed = false}
			}
		}
	
	//move slower during swing
	if swing and not dashing {xspd *= .3; yspd *= .3}
	
	event_inherited()
	
	//animate
		if xspd == 0 && yspd == 0
			{
			image_index = 0;
			}
	
	//get knocked back
	if state = "knockback"
		{
		var opposite_direction = (hitDirection + 180) mod 360;
		var newX = lengthdir_x(knockbackSpeed, opposite_direction)
		var newY = lengthdir_y(knockbackSpeed, opposite_direction)
	
		if !place_meeting(x + newX, y + newY, global.wall_list) 
			{
		    x += newX
		    y += newY
			}
		
		knockbackTime --
	
		if knockbackTime <= 0
			{
			state = "none"
			knockbackTime = ogKnockbackTime
			}
		}
}
