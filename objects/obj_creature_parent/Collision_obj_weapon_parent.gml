//get knocked back if not owning the weapon
if (equippedItem == undefined or other.id != self.equippedItem.id && state != "dead" && other.visible)
	{
	state = "knockback"
	hitDirection = point_direction(x, y, other.x, other.y)
	}