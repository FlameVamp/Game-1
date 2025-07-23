if !array_contains(behavior_stack, "dead") && array_contains(behavior_stack, "attack")
	{
	var inHit = false
		for (var i = 0; i < array_length(hit); i++)
			{	
			if hit[i] == other
				{inHit = true; break;}
			}
		if !inHit
			{
			if other.currHealth - meleeDamage < 0
					{other.currHealth = 0; other.state = "dead"}
				else
					{other.currHealth -= meleeDamage}

			if asset_has_any_tag(object_index, "damages_stamina", asset_object)
				{
				if other.currStamina - staminaDamage < 0
					{other.currStamina = 0}
				else
					{other.currStamina -= staminaDamage}
				}
	
			if asset_has_any_tag(object_index, "damages_magicka", asset_object)
				{
				if other.currMagicka - magickaDamage < 0
					{other.currMagicka = 0}
				else
					{other.currMagicka -= magickaDamage}
				}
			array_push(hit, other)
			}
	}