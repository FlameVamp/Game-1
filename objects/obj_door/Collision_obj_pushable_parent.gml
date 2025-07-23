if !unlocked
	{
	if abs((image_angle mod 180)) == 0
		{
		if point_distance(other.x + other.sprite_width/2, other.y + other.sprite_height/2, other.x + other.sprite_width/2, bbox_top) < point_distance(other.x + other.sprite_width/2, other.y + other.sprite_height/2, other.x + other.sprite_width/2, bbox_bottom)
			{other.y = bbox_top - other.sprite_height}
		else
			{other.y = bbox_bottom}
		}
	else if abs((image_angle mod 180)) == 90
		{
		if point_distance(other.x + other.sprite_width/2, other.y + other.sprite_height/2, bbox_left, other.y) < point_distance(other.x + other.sprite_width/2, other.y + other.sprite_height/2, bbox_right, other.y)
			{other.x = bbox_left - other.sprite_width}
		else
			{other.x = bbox_right}
		}
	}