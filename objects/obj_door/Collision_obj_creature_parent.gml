if !unlocked
	{
	if abs((image_angle mod 180)) == 0
		{
		if point_distance(other.x, other.y, other.x, bbox_top) < point_distance(other.x, other.y, other.x, bbox_bottom)
			{other.y = bbox_top - point_distance(other.bbox_left, other.bbox_top, other.bbox_left, other.bbox_bottom)/2}
		else
			{other.y = bbox_bottom + point_distance(other.bbox_left, other.bbox_top, other.bbox_left, other.bbox_bottom)/2}
		}
	else if abs((image_angle mod 180)) == 90
		{
		if point_distance(other.x, other.y, bbox_left, other.y) < point_distance(other.x, other.y, bbox_right, other.y)
			{other.x = bbox_left - point_distance(other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_top)/2}
		else
			{other.x = bbox_right + point_distance(other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_top)/2}
		}
	if other.currHealth - 10 < 0
		{other.currHealth = 0; other.state = "dead"}
	else
		{other.currHealth -= 10}
	}