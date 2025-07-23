push_weight = 0

pressed = false

pusher_list = [
	obj_player,
	obj_pushable_parent
]

//become activated
function press(pusher)
	{
	if variable_instance_exists(pusher, "weight")
		{
		with(pusher)
			{
			if weight >= other.push_weight && position_meeting(x + sprite_width/2, y + sprite_height/2, other)
				{
				other.pressed = true
				}
			else
				{
				other.pressed = false
				}
			}
		}
	else
		{
		with(pusher)
			{
			if position_meeting(x, y, other)
				{
				other.pressed = true
				}
			else
				{
				other.pressed = false
				}
			}
		}
	}