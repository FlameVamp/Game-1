//mp_grid_draw(grid)

var xLimit = room_width/16
var yLimit = room_height/16
/*
for (var i = 0; i <= xLimit; i++)
	{
	for (var e = 0; e <= yLimit; e++)
		{
		if ds_map_find_value(light_list, i) != undefined
			{
			if !array_contains(ds_map_find_value(light_list, i), e)
				{
				draw_set_color(c_black)
				draw_rectangle(i*16, e*16, i*16+16, e*16+16, false)
				}
			}
		else 
			{
			draw_set_color(c_black)
			draw_rectangle(i*16, e*16, i*16+16, e*16+16, false)
			}
		}
	}
*/