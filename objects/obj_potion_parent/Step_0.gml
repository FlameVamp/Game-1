//setting item weight for potions
if weight == 0
	{
	if string_pos("Light", name)
		{
		weight = 0.25
		}
	else if string_pos("Moderate", name)
		{
		weight = 0.5
		}
	else if string_pos("Grand", name)
		{
		weight = 1.0
		}
	}

//setting healing type for potions	
if !healHealth && !healMagicka && !healStamina
	{
	if string_pos("Health", name)
		{healHealth = true}
	if string_pos("Stamina", name)
		{healStamina = true}
	if string_pos("Magicka", name)
		{healMagicka = true}
	}

//setting heal amount for potions	
if healAmount == 0
	{
	if string_pos("Light", name)
		{healAmount = 10}
	if string_pos("Moderate", name)
		{healAmount = 15}
	if string_pos("Grand", name)
		{healAmount = 25}
	}