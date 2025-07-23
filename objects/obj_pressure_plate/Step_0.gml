if pressed && image_index != 1
	{
	image_index = 1
	}
else if image_index == 1
	{
	image_index = 0
	}
	
if pressed && !place_meeting(x, y, pusher_list)
	{
	pressed = false
	}
	