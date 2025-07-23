if other.xspd != 0 or other.yspd != 0
	{
	destroyed = true
	if array_length(neighbors) > 0
		{die()}
	instance_destroy(self)
	}