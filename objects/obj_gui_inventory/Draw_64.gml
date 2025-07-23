var inv_key = keyboard_check_pressed(vk_tab)
var view_w = (1.5*INVENTORY_SLOTS)*(spriteSize-1)+4
var view_h = INVENTORY_SLOTS*(spriteSize-1)+4
var scroll_up = mouse_wheel_up()
var scroll_down = mouse_wheel_down()
global.activate_key = keyboard_check_pressed(ord("F")) or mouse_check_button_pressed(mb_left)
global.drop_key = keyboard_check_pressed(ord("R"))

inv_x = display_get_width()/2 - (view_w)/2
inv_y = display_get_height()/2- (view_h)/2


//create the stack if the stack is empty
if array_length(stack) <= 1
	{
	stack = reStack(inventory, 0)
	}

//toggles the inventory does things when inventory is closed
if inv_key
	{
	items_x = 0
	items_y = 0
	if global.toggle_inv
		{
		global.toggle_inv = false
		loot_bag = undefined
		instance_activate_all()
		obj_player.pause = false
		if instance_exists(obj_gui_loot_menu) {obj_gui_loot_menu.stack = reStack(obj_gui_loot_menu.inventory, 0)}
		}
	else if !global.toggle_inv
		{
		global.toggle_inv = true
		}
	}
//inventory code
if global.toggle_inv
	{
	instance_deactivate_all(true)
	instance_activate_object(obj_gui_hud)
	instance_activate_object(obj_player)
	instance_activate_object(obj_chest)
	obj_player.pause = true
	if (!surface_exists(clip_surface)) {
	    clip_surface = surface_create(view_w, view_h);
		}
	//clear and start drawing to surface:
	surface_set_target(clip_surface);
	
	draw_clear_alpha(c_black, 0);
	//finish and draw the surface itself:
	draw_sprite_stretched(spr_inventory, 0, 0, 0, view_w, view_h)
	var num = 0
	switch inv_tab
		{
		//if inv tab is inventory
		case "inventory":
			for (var i = 1; i < array_length(stack); i += 1)
				{
				instance_activate_object(stack[i][0])
				stack[i][0].visible = false
				if (stack[i][0] != -1 && instance_exists(stack[i][0]))
					{
					yy = items_y + num * (spriteSize - 1*global.screenRatio)
					
					//items and selection
					stack[i][0].image_angle = 0
					stack[i][0].image_index = 0
					if sprite_get_height(stack[i][0].sprite_index) == 16
						{
						if (window_mouse_get_x() - 44*global.screenRatio > stack[i][0].x - (sprite_get_xoffset(object_get_sprite(stack[i][0].object_index)) + 3)*global.screenRatio + 1 && window_mouse_get_x() - 37*global.screenRatio < stack[i][0].x - 4*global.screenRatio + inv_x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio + view_w*.81 + 2) && (window_mouse_get_y() - 12*global.screenRatio > stack[i][0].y + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio - 15*global.screenRatio && window_mouse_get_y() - 12*global.screenRatio < stack[i][0].y + inv_y + spriteSize - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio - 16*global.screenRatio + 1)
							{
							draw_set_color(c_grey)
							draw_rectangle(stack[i][0].x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio - 3*global.screenRatio + 1, stack[i][0].y + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio - 12*global.screenRatio - 2, stack[i][0].x - 4*global.screenRatio + inv_x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio + view_w*.83 + 3, stack[i][0].y + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio + 8*global.screenRatio - 3, false)
							selectedItem = stack[i][0]
							}
						stack[i][0].x = items_x + 3*global.screenRatio + sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio
						stack[i][0].y = yy + 3*global.screenRatio + sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio
						stack[i][0].image_xscale = global.screenRatio
						stack[i][0].image_yscale = global.screenRatio
						}
					else if sprite_get_height(stack[i][0].sprite_index) == 8
						{
						if (window_mouse_get_x() - 42*global.screenRatio > stack[i][0].x - (sprite_get_xoffset(object_get_sprite(stack[i][0].object_index)) + 3)*global.screenRatio + 1 && window_mouse_get_x() - 37*global.screenRatio < stack[i][0].x - 4*global.screenRatio + inv_x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2 + view_w*.81 + 2) && (window_mouse_get_y() - 12*global.screenRatio > stack[i][0].y + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio - 21*global.screenRatio && window_mouse_get_y() - 12*global.screenRatio < stack[i][0].y + inv_y + spriteSize - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio - 22*global.screenRatio + 1)
							{
							draw_set_color(c_grey)
							draw_rectangle(stack[i][0].x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2 - 3*global.screenRatio + 1, stack[i][0].y + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2 - 12*global.screenRatio - 2, stack[i][0].x - global.screenRatio + inv_x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio + view_w*.81 + 2, stack[i][0].y + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2 + 8*global.screenRatio - 3, false)
							selectedItem = stack[i][0]
							}
						stack[i][0].x = items_x + 3*global.screenRatio + sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2
						stack[i][0].y = yy + 3*global.screenRatio + sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2
						stack[i][0].image_xscale = global.screenRatio * 2
						stack[i][0].image_yscale = global.screenRatio * 2
						}
					
					stack[i][0].depth = 100
					stack[i][2] = yy
					with (stack[i][0]) {
						event_perform(ev_draw, 0);
						}
					//text
					draw_set_color(c_white)
					draw_text_transformed(items_x + 6*global.screenRatio + spriteSize, yy + 3*global.screenRatio, stack[i][0].name, 3, 3, 0)
					draw_text_transformed(items_x + 2*global.screenRatio + spriteSize*6, yy + 3*global.screenRatio, stack[i][0].type, 3, 3, 0)
					draw_text_transformed(items_x + 11*global.screenRatio + spriteSize*9, yy + 3*global.screenRatio, stack[i][0].weight, 3, 3, 0)

					draw_sprite_stretched(spr_inventory_slot, 0, items_x + 1*global.screenRatio, yy + 1*global.screenRatio, spriteSize, spriteSize)
					//inventory popup
					if (window_mouse_get_x() > stack[i][0].x - 4*global.screenRatio + inv_x - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio && window_mouse_get_x() < stack[i][0].x + inv_x + spriteSize - 4*global.screenRatio - sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio) && (window_mouse_get_y() > stack[i][0].y - 2*global.screenRatio + inv_y - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio && window_mouse_get_y() < stack[i][0].y + inv_y + spriteSize - sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio)
						{
						if !layer_exists("top")
							{layer_create(-100, "top")}
						if (popup == undefined) or (!instance_exists(popup))
							{popup = instance_create_layer(0, 0, "top", obj_gui_inv_popup)}
						with popup
							{
							popup(other.stack[i][0], other.inv_x, other.inv_y, other.spriteSize);
							}
						}
					num += 1
					}
				}
			//numbering the stack amount for each item - CAN BE EFFICIENCIED
			for (var e = 1; e < array_length(stack); e += 1)
				{
				if stack[e][1] > 1
					{draw_text_transformed_color(items_x*global.screenRatio +  spriteSize - 5*global.screenRatio, stack[e][2] + 7*global.screenRatio, string(stack[e][1]), 3, 3, 0, c_black, c_black, c_black, c_black, 1)}
				}
			//scrolling inventory
			if (scroll_up  or scroll_down) && array_length(stack) - 1 > INVENTORY_SLOTS
				{
				if sprite_get_height(stack[1][0].sprite_index) == 16
					{
					if (array_first(array_last(stack)).y + spriteSize - 2*global.screenRatio - sprite_get_yoffset(object_get_sprite(array_first(array_last(stack)).object_index))*global.screenRatio >= view_h) && scroll_down
						{items_y -= global.screenRatio}
					else if (array_first(stack[1]).y - global.screenRatio - sprite_get_yoffset(object_get_sprite(stack[1][0].object_index))*global.screenRatio <= 2) && scroll_up
						{items_y += global.screenRatio}
					}
				else if sprite_get_height(stack[1][0].sprite_index) == 8
					{
					if (array_first(array_last(stack)).y + spriteSize - 2*global.screenRatio - sprite_get_yoffset(object_get_sprite(array_first(array_last(stack)).object_index))*global.screenRatio >= view_h) && scroll_down
						{items_y -= global.screenRatio}
					else if (array_first(stack[1]).y - global.screenRatio - sprite_get_yoffset(object_get_sprite(stack[1][0].object_index))*2*global.screenRatio <= 2) && scroll_up
						{items_y += global.screenRatio}
					}
				}
			else if array_length(stack) - 1 <= INVENTORY_SLOTS && items_y != 0
				{items_y = 0}
			//eating/drinking stuff
			if selectedItem != undefined && global.activate_key && selectedItem.type == "Consumable"
				{
				obj_player.heal(selectedItem, selectedItem.healAmount)
				stack = removeItem(inventory, selectedItem, true, 0)
				}
			//equipping weapons
			else if selectedItem != undefined && global.activate_key && selectedItem.type == "Weapon"
				{
				obj_player.equippedItem = selectedItem
				}
			else if selectedItem != undefined && global.activate_key && selectedItem.type == "Armor"
				{
				if selectedItem.slotType == "Head"
					{obj_player.equippedHead = selectedItem}
				else if selectedItem.slotType == "Chest"
					{obj_player.equippedChest = selectedItem}
				else if selectedItem.slotType == "Legs"
					{obj_player.equippedLegs = selectedItem}
				else if selectedItem.slotType == "R Foot"
					{obj_player.equippedFootRight = selectedItem}
				else if selectedItem.slotType == "L Foot"
					{obj_player.equippedFootLeft = selectedItem}
				else if selectedItem.slotType == "R Shoulder"
					{obj_player.equippedShoulderRight = selectedItem}
				else if selectedItem.slotType == "L Shoulder"
					{obj_player.equippedShoulderLeft = selectedItem}
				else if selectedItem.slotType == "R Arm"
					{obj_player.equippedArmRight = selectedItem}
				else if selectedItem.slotType == "L Arm"
					{obj_player.equippedArmLeft = selectedItem}
				}
			//dropping items and creating a loot bag
			if selectedItem != undefined && global.drop_key
				{
				if loot_bag == undefined
					{
					var bag = instance_nearest(obj_player.x, obj_player.y, obj_chest)
					if instance_exists(obj_chest) && point_distance(obj_player.x, obj_player.y, bag.x, bag.y) < 16
						{loot_bag = bag}
					else {loot_bag = instance_create_layer(obj_player.x, obj_player.y, "loot", obj_loot_bag)}
					}
				addItem(loot_bag.inventory, selectedItem, true, 0)
				stack = removeItem(inventory, selectedItem, true, 0)
				if selectedItem == obj_player.equippedItem
					{obj_player.equippedItem = undefined}
				else if selectedItem == obj_player.equippedHead
					{obj_player.equippedHead = undefined}
				else if selectedItem == obj_player.equippedChest
					{obj_player.equippedChest = undefined}
				else if selectedItem == obj_player.equippedLegs
					{obj_player.equippedLegs = undefined}
				else if selectedItem == obj_player.equippedFootRight
					{obj_player.equippedFootRight = undefined}
				else if selectedItem == obj_player.equippedFootLeft
					{obj_player.equippedFootLeft = undefined}
				else if selectedItem == obj_player.equippedShoulderRight
					{obj_player.equippedShoulderRight = undefined}
				else if selectedItem == obj_player.equippedShoulderLeft
					{obj_player.equippedShoulderLeft = undefined}
				else if selectedItem == obj_player.equippedArmRight
					{obj_player.equippedArmRight = undefined}
				else if selectedItem == obj_player.equippedArmLeft
					{obj_player.equippedArmLeft = undefined}
				}
			break;
		//equipment inv tab
		case "equipment":
		}
	surface_reset_target();
	draw_surface(clip_surface, inv_x, inv_y);
	}
else {}