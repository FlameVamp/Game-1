//stun behavior
function stun_behavior()
	{
	stunTime--
	if stunTime <= 0
		{
		stunTime = ogStunTime
		alarm[0] = 1
		return "Success"
		}
	return "Progress"
	}