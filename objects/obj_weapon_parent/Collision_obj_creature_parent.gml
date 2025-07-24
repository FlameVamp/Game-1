//hitting a creature
if !asset_has_any_tag(other.object_index, "container", asset_object) && owner != undefined
	{
	//making sure creature isn't owner
	if (other.equippedItem == undefined or self.id != other.equippedItem.id && other.state != "dead" && visible)
		{
		//only hit each creature once per swing
		var inHit = false
		for (var i = 0; i < array_length(hit); i++)
			{	
			if hit[i] == other
				{inHit = true; break;}
			}
		if !inHit
			{
			if owner.currStamina <= 0
				{var tempDamage = 0.5*damage}
			else
				{var tempDamage = damage}
			other.damage(damage)
			array_push(hit, other)
			}
		}
	}