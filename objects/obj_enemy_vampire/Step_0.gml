if pathing && path_position == 1 && !array_contains(behavior_stack, "attack") && target = obj_player && attackCooldown <= 0
	{
	head = instance_create_depth(x, y, obj_player.depth + 1, obj_attacking_vampire_head)
	var int = irandom_range(0 ,1)
	if int == 0
		{
		if obj_player.leftLatch == undefined {obj_player.leftLatch = self; image_index = 0; latchDir = 0}
		else if obj_player.rightLatch == undefined {obj_player.rightLatch = self; image_index = 1; latchDir = 1}
		}
	else if int == 1
		{
		if obj_player.rightLatch == undefined {obj_player.rightLatch = self; image_index = 1; latchDir = 1}
		else if obj_player.leftLatch == undefined {obj_player.leftLatch = self; image_index = 0; latchDir = 0}
		}
	head.image_index = image_index
	}
	
if array_contains(behavior_stack, "dead")
	{if obj_player.leftLatch = self {unlatch()}
	if obj_player.rightLatch = self {unlatch()}}
	
// Inherit the parent event
event_inherited();

if array_contains(behavior_stack, "attack") && (obj_player.leftLatch != self && obj_player.rightLatch != self)
	{unlatch()}