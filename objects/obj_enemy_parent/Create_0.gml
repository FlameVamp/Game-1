// Inherit the parent event
event_inherited();

staminaDamage = 0
magickaDamage = 0

pathing = false

if !layer_exists("loot")
	{layer_create(100, "loot")}

guix = 0
guiy = 0

target = undefined
target_x = undefined
target_y = undefined
target_rdm_x = random_range(-32, 32)
target_rdm_y = random_range(-32, 32)
path = undefined

ogAttackCooldown = 30
attackCooldown = 0

targetDir = 0

attackX = 0
attackY = 0

hit = []

alarm[0] = 1
alarm[1] = 1

prev_x = 0
prev_y = 0

moveAway = false

behavior_stack = array_create(0)
behavior_running = true

//run behaviors
function execute_behavior(behavior)
	{
	if behavior == "knockback"
		{
		event_user(0)
		return knockback_behavior()
		}
	else if behavior == "stunned"
		{
		event_user(1)
		return stun_behavior()
		}
	else if behavior == "dead"
		{
		alarm[0] = -1; if path_exists(path) {path_delete(path)}
		return "Progress"
		}
	else if behavior == "attack"
		{
		event_user(2)
		return attack_behavior()
		}
	}
	
function moving(newX, newY)
	{
	var colObject = instance_place(x + newX, y + newY, global.wall_list)
	if colObject != noone
		{
		if colObject.object_index == obj_door
			{if colObject.unlocked {x += newX; y += newY; return true} else {return false}}
		else
			{
			x += newX
			y += newY
			return true
			}
		}
	else {return false}
	}