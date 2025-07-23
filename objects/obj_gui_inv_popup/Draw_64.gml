
//pops up information about an item in the inventory
if spriteSize != undefined && global.toggle_inv
	{
	draw_sprite_stretched(spr_inventory, 0, window_mouse_get_x(), window_mouse_get_y(), spriteSize*5, spriteSize*2)
	draw_text_transformed(window_mouse_get_x() + 1*global.screenRatio, window_mouse_get_y() - 3*global.screenRatio, item.name, 3, 3, 0)
	draw_text_ext_transformed(window_mouse_get_x() + 1*global.screenRatio, window_mouse_get_y() + spriteSize/2, item.description, spriteSize/6, spriteSize*2.5, 2, 2, 0)
	layer_destroy("top")
	}