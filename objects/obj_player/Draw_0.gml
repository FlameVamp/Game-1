if !pause
	{
	// Inherit the parent event
	event_inherited();
	
	if equippedHead != undefined
		{
		equippedHead.visible = true
		equippedHead.depth = -1000
		equippedHead.image_xscale = 1
		equippedHead.image_yscale = 1
		equippedHead.x = x
		equippedHead.y = y - 6	
		switch face
			{
			case UP:
				equippedHead.image_index = 2
				break;
			case RIGHT:
				equippedHead.image_index = 0
				break;
			case DOWN:
				equippedHead.x -= 1
				equippedHead.image_index = 1
				break;
			case LEFT:
				equippedHead.x -= 1
				equippedHead.image_index = 1
				break;
			}
		}
	if equippedChest != undefined
		{
		equippedChest.visible = true
		equippedChest.depth = -1000
		equippedChest.image_xscale = 1
		equippedChest.image_yscale = 1
		equippedChest.x = x
		equippedChest.y = y
		switch face
			{
			case UP:
				equippedChest.image_index = 0
				break;
			case RIGHT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedChest.image_index = 1}
				else if floor(image_index) == 1
					{equippedChest.image_index = 3}
				else if floor(image_index) == 3
					{equippedChest.image_index = 2}
				break;
			case DOWN:
				equippedChest.image_index = 0
				break;
			case LEFT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedChest.image_index = 1}
				else if floor(image_index) == 1
					{equippedChest.image_index = 2}
				else if floor(image_index) == 3
					{equippedChest.image_index = 3}
				break;
			}
		}
	if equippedLegs != undefined
		{
		equippedLegs.visible = true
		equippedLegs.depth = -1000
		equippedLegs.image_xscale = 1
		equippedLegs.image_yscale = 1
		equippedLegs.x = x
		equippedLegs.y = y
		switch face
			{
			case UP:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedLegs.image_index = 0}
				else if floor(image_index) == 1
					{equippedLegs.image_index = 1}
				else if floor(image_index) == 3
					{equippedLegs.image_index = 2}
				break;
			case RIGHT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedLegs.image_index = 5}
				else if floor(image_index) == 1 or floor(image_index) == 3
					{equippedLegs.image_index = 6}
				break;
			case DOWN:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedLegs.image_index = 0}
				else if floor(image_index) == 1
					{equippedLegs.image_index = 4}
				else if floor(image_index) == 3
					{equippedLegs.image_index = 3}
				break;
			case LEFT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedLegs.image_index = 5}
				else if floor(image_index) == 1 or floor(image_index) == 3
					{equippedLegs.image_index = 6}
				break;
			}
		}
	if equippedFootRight != undefined
		{
		equippedFootRight.visible = true
		equippedFootRight.depth = -1000
		equippedFootRight.image_xscale = 1
		equippedFootRight.image_yscale = 1
		equippedFootRight.x = x
		equippedFootRight.y = y + 4
		equippedFootRight.image_index = 0
		switch face
			{
			case UP:
				if floor(image_index) == 1
					{equippedFootRight.y = y + 3}
				break;
			case RIGHT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedFootRight.x = x - 1}
				else if floor(image_index) == 3
					{equippedFootRight.x = x - 3; equippedFootRight.y = y + 3}
				break;
			case DOWN:
				equippedFootRight.x = x - 2
				if floor(image_index) == 1
					{equippedFootRight.y = y + 3}
				break;
			case LEFT:
				equippedFootRight.image_index = 1
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedFootRight.visible = false}
				else if floor(image_index) == 1
					{equippedFootRight.x = x + 1; equippedFootRight.y = y + 3}
				else if floor(image_index) == 3
					{equippedFootRight.x = x - 2}
				break;
			}
		}
	if equippedFootLeft = undefined
		{}
	if equippedShoulderRight != undefined
		{}
	if equippedShoulderLeft != undefined
		{}
	if equippedArmRight != undefined
		{}
	if equippedArmLeft != undefined
		{}
	}

