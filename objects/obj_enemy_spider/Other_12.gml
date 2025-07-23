//attack behavior
ogAttackTime = distance_to_point(attackX, attackY)/jump_spd
function attack_behavior()
	{
	var newX = lengthdir_x(jump_spd, targetDir)
	var newY = lengthdir_y(jump_spd, targetDir)
	
	if !place_meeting(x + newX, y + newY, global.wall_list)
		{
		x += newX
		y += newY
		}
		

	if attackTime <= 0
		{
		attackTime = ogAttackTime
		target_rdm_x = random_range(-32, 32); target_rdm_y = random_range(-32, 32)
		attackCooldown = ogAttackCooldown
		return "Success"
		}
	attackTime--
	return "Progress"
	}