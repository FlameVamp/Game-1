if slotType == undefined
	{
	if string_pos("Helmet", name)
		{slotType = "Head"}
	else if string_pos("Cuirass", name)
		{slotType = "Chest"}
	else if string_pos("Greaves", name)
		{slotType = "Legs"}
	else if string_pos("Right", name)
		{
		if string_pos("Boot", name)
			{slotType = "R Foot"}
		else if string_pos("Gauntlet", name)
			{slotType = "R Arm"}
		else if string_pos("Pauldron", name)
			{slotType = "R Shoulder"}
		}
	else if string_pos("Left", name)
		{
		if string_pos("Boot", name)
			{slotType = "L Foot"}
		else if string_pos("Gauntlet", name)
			{slotType = "L Arm"}
		else if string_pos("Pauldron", name)
			{slotType = "L Shoulder"}
		}
	}