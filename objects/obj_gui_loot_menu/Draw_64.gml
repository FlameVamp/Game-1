var scroll_up = mouse_wheel_up()
var scroll_down = mouse_wheel_down()
global.activate_key = keyboard_check_pressed(ord("F"))

if asset_has_any_tag(owner.object_index, "container", asset_object ) && !owner.unlocked
	{inventory = undefined}

if inventory != undefined and array_length(inventory) > 0
	{
	if stack == undefined
		{stack = reStack(inventory, yy)}
	if (!surface_exists(clip_surface)) {
	    clip_surface = surface_create(view_w, view_h);
		}
	// clear and start drawing to surface:
	surface_set_target(clip_surface);
	
	draw_clear_alpha(c_black, 0);
	// finish and draw the surface itself:
	draw_sprite_stretched(spr_inventory, 0, 0, 0, view_w, view_h)
	var num = 0
	for (var i = 1; i < array_length(stack); i += 1)
		{
		instance_activate_object(stack[i][0])
		stack[i][0].visible = false
		if (stack[i][0] != -1 && instance_exists(stack[i][0]))
			{
			yy = items_y + num * (spriteSize/2 + 2.5*global.screenRatio)
			
			stack[i][0].image_angle = 0
			stack[i][0].image_index = 0
			if sprite_get_height(stack[i][0].sprite_index) == 16
					{
					stack[i][0].x = items_x + 2.33*global.screenRatio + sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio/1.5
					stack[i][0].y = yy + 2.33*global.screenRatio + sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio/1.5
					stack[i][0].image_xscale = global.screenRatio/1.5
					stack[i][0].image_yscale = global.screenRatio/1.5
					}
				else if sprite_get_height(stack[i][0].sprite_index) == 8
					{
					stack[i][0].x = items_x + 2.33*global.screenRatio + sprite_get_xoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2/1.5
					stack[i][0].y = yy + 2.33*global.screenRatio + sprite_get_yoffset(object_get_sprite(stack[i][0].object_index))*global.screenRatio*2/1.5
					stack[i][0].image_xscale = global.screenRatio*2/1.5
					stack[i][0].image_yscale = global.screenRatio*2/1.5
					}
					
			stack[i][0].depth = 100
			stack[i][2] = yy
			with (stack[i][0]) {
				event_perform(ev_draw, 0);
				}
			draw_text_transformed(items_x + global.screenRatio + spriteSize/1.25, yy + 3*global.screenRatio, stack[i][0].name, 2, 2, 0)
			draw_text_transformed(items_x + 2*global.screenRatio + spriteSize*4.1, yy + 3*global.screenRatio, stack[i][0].weight, 2, 2, 0)
			draw_sprite_stretched(spr_inventory_slot, 0, items_x + 1*global.screenRatio, yy + 1*global.screenRatio, spriteSize/1.5, spriteSize/1.5)
			if (window_mouse_get_x() > stack[i][0].x - 4*global.screenRatio + inv_x && window_mouse_get_x() < stack[i][0].x + inv_x + spriteSize - 4*global.screenRatio) && (window_mouse_get_y() > stack[i][0].y - 2*global.screenRatio + inv_y && window_mouse_get_y() < stack[i][0].y + inv_y + spriteSize)
				{
				layer_create(-100, "top")
				with (instance_create_layer(0, 0, "top", obj_gui_inv_popup))
					{
					popup(other.stack[i][0], other.inv_x, other.inv_y, other.spriteSize);
					}
				}
			}
		num += 1
		}
	for (var e = 1; e < array_length(stack); e += 1)
		{
		if stack[e][1] > 1
			{draw_text_transformed_color(items_x*global.screenRatio +  spriteSize/2 + global.screenRatio, stack[e][2] + 6*global.screenRatio, string(stack[e][1]), 2, 2, 0, c_black, c_black, c_black, c_black, 1)}
		}
	if (scroll_up  or scroll_down) && array_length(stack) - 1 >= 5
		{
		if (array_first(array_last(stack)).y + spriteSize - 7*global.screenRatio - sprite_get_yoffset(object_get_sprite(array_first(array_last(stack)).object_index))*global.screenRatio/1.5 >= view_h) && scroll_down
			{items_y -= global.screenRatio}
		else if (array_first(stack[1]).y - global.screenRatio/2 - sprite_get_yoffset(object_get_sprite(stack[1][0].object_index))*global.screenRatio/1.5 <= 2) && scroll_up
			{items_y += global.screenRatio}
		}
	surface_reset_target();
	draw_surface(clip_surface, inv_x, inv_y);
	
	if global.activate_key && array_length(inventory) > 0 && can_loot
		{
		obj_gui_inventory.stack = addItem(obj_gui_inventory.inventory, array_first(inventory), true, 0)
		stack = removeItem(inventory, array_first(inventory), true, 0)
		}
	}
else {instance_activate_all(); for (var i = 0; i < array_length(inventory); i += 1) {instance_deactivate_object(stack[i][0])};}