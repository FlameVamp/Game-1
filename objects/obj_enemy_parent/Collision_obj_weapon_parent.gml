//when touching a weapon and it's not equipped by this, get knocked back
if (equippedItem == undefined or other.id != self.equippedItem.id && state != "dead")
	{
	if !array_contains(behavior_stack, "knockback")
		{array_insert(behavior_stack, 0, "knockback")}
	hitDirection = point_direction(x, y, other.x, other.y)
	}

