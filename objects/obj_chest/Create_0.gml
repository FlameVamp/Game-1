depth = -y
open = false

inventory = array_create(0, -1)

behavior_stack = array_create(0, -1)
array_push(behavior_stack, "dead")

guix = 0
guiy = 0

unlocked = false


if !layer_exists("loot")
	{layer_create(100, "loot")}
array_push(inventory, instance_create_layer(0, 0, "loot", obj_grand_health_potion))