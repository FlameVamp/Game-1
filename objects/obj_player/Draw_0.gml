if !pause
	{
	// Inherit the parent event
	event_inherited();
	
	if equippedHead != undefined
		{
		equippedHead.visible = true
		equippedHead.depth = depth - 1
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
		equippedChest.depth = depth - 1
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
		equippedLegs.depth = depth - 1
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
				else if floor(image_index) == 1
					{equippedLegs.image_index = 7}
				else if floor(image_index) == 3
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
				else if floor(image_index) == 1
					{equippedLegs.image_index = 6}
				else if floor(image_index) == 3
					{equippedLegs.image_index = 7}
				break;
			}
		}
	if equippedFootRight != undefined
		{
		equippedFootRight.visible = true
		equippedFootRight.depth = depth - 1
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
	if equippedFootLeft != undefined
		{
		equippedFootLeft.visible = true
		equippedFootLeft.depth = depth - 1
		equippedFootLeft.image_xscale = 1
		equippedFootLeft.image_yscale = 1
		equippedFootLeft.x = x - 2
		equippedFootLeft.y = y + 4
		equippedFootLeft.image_index = 0
		switch face
			{
			case UP:
				if floor(image_index) == 3
					{equippedFootLeft.y = y + 3}
				break;
			case RIGHT:
				equippedFootLeft.image_index = 1
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedFootLeft.visible = false}
				else if floor(image_index) == 1
					{equippedFootLeft.x = x - 3 equippedFootLeft.y = y + 3}
				else if floor(image_index) == 3
					{equippedFootLeft.x = x}
				break;
			case DOWN:
				equippedFootLeft.x = x
				if floor(image_index) == 3
					{equippedFootLeft.y = y + 3}
				break;
			case LEFT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedFootLeft.x = x - 1}
				else if floor(image_index) == 3
					{equippedFootLeft.x = x + 1; equippedFootLeft.y = y + 3}
				break;
			}
		}
	if equippedShoulderRight != undefined
		{
		equippedShoulderRight.visible = true
		equippedShoulderRight.depth = depth - 1
		equippedShoulderRight.image_xscale = 1
		equippedShoulderRight.image_yscale = 1
		equippedShoulderRight.x = x + 2
		equippedShoulderRight.y = y - 4
		equippedShoulderRight.image_index = 0
		equippedShoulderRight.sprite_index = equippedShoulderRight.sprite
		switch face
			{
			case UP:
				break;
			case RIGHT:
				equippedShoulderRight.image_index = 1
				equippedShoulderRight.x = x
				equippedShoulderRight.y = y - 4
				break;
			case DOWN:
				equippedShoulderRight.sprite_index = equippedShoulderRight.otherSide
				equippedShoulderRight.x = x - 2
				break;
			case LEFT:
				equippedShoulderRight.visible = false
				break;
			}
		}
	if equippedShoulderLeft != undefined
		{
		equippedShoulderLeft.visible = true
		equippedShoulderLeft.depth = depth - 1
		equippedShoulderLeft.image_xscale = 1
		equippedShoulderLeft.image_yscale = 1
		equippedShoulderLeft.x = x - 2
		equippedShoulderLeft.y = y - 4
		equippedShoulderLeft.image_index = 0
		equippedShoulderLeft.sprite_index = equippedShoulderLeft.sprite
		switch face
			{
			case UP:
				break;
			case RIGHT:
				equippedShoulderLeft.visible = false
				break;
			case DOWN:
				equippedShoulderLeft.sprite_index = equippedShoulderLeft.otherSide
				equippedShoulderLeft.x = x + 2
				break;
			case LEFT:
				equippedShoulderLeft.image_index = 1
				equippedShoulderLeft.x = x
				equippedShoulderLeft.y = y - 4
				break;
			}
		}
	if equippedArmRight != undefined
		{
		equippedArmRight.visible = true
		equippedArmRight.depth = depth - 1
		equippedArmRight.image_xscale = 1
		equippedArmRight.image_yscale = 1
		equippedArmRight.x = x
		equippedArmRight.y = y - 2
		equippedArmRight.image_index = 0
		switch face
			{
			case UP:
				equippedArmRight.x = x + 2
				if floor(image_index) == 3
					{equippedArmRight.image_index = 1}
				break;
			case RIGHT:
				if floor(image_index) == 1
					{equippedArmRight.image_index = 4}
				else if floor(image_index) == 3
					{equippedArmRight.image_index = 5}
				break;
			case DOWN:
				equippedArmRight.x = x - 2
				if floor(image_index) == 1
					{equippedArmRight.image_index = 2}
				break;
			case LEFT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedArmRight.visible = false}
				else if floor(image_index) == 1
					{equippedArmRight.image_index = 6}
				else if floor(image_index) == 3
					{equippedArmRight.image_index = 7}
				break;
			}
		}
	if equippedArmLeft != undefined
		{
		equippedArmLeft.visible = true
		equippedArmLeft.depth = depth - 1
		equippedArmLeft.image_xscale = 1
		equippedArmLeft.image_yscale = 1
		equippedArmLeft.x = x
		equippedArmLeft.y = y - 2
		equippedArmLeft.image_index = 0
		switch face
			{
			case UP:
				equippedArmLeft.x = x - 2
				if floor(image_index) == 1
					{equippedArmLeft.image_index = 1}
				break;
			case RIGHT:
				if floor(image_index) == 0 or floor(image_index) == 2
					{equippedArmLeft.visible = false}
				else if floor(image_index) == 1
					{equippedArmLeft.image_index = 7}
				else if floor(image_index) == 3
					{equippedArmLeft.image_index = 6}
				break;
			case DOWN:
				equippedArmLeft.x = x + 2
				if floor(image_index) == 3
					{equippedArmLeft.image_index = 3}
				break;
			case LEFT:
				if floor(image_index) == 1
					{equippedArmLeft.image_index = 5}
				else if floor(image_index) == 3
					{equippedArmLeft.image_index = 4}
				break;
			}
		}
	}

