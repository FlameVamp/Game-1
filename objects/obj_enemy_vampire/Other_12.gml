//attack behavior
function attack_behavior()
	{
	x = obj_player.x; head.x = x
	y = obj_player.y; head.y = y
	depth = obj_player.depth - 1; head.depth = depth + 2
	sprite_index = spr_vampire_attack
	image_index = latchDir
	
	obj_player.damage(meleeDamage/32)
	
	return "Progress"
	}