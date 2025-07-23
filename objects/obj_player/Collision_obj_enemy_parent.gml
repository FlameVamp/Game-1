

//knockback
if !array_contains(other.behavior_stack, "dead")
	{
	state = "knockback"
	hitDirection = point_direction(x, y, other.x, other.y)
	}

else if array_contains(other.behavior_stack, "dead")
	{
	var num = 0
	for (var i = 0; i < instance_number(obj_enemy_parent); i++)
			{
			var notme = instance_find(obj_enemy_parent, i)

			if !asset_has_any_tag(notme.object_index, "container", asset_object) && notme.target != undefined && notme.target.id == self.id && !array_contains(notme.behavior_stack, "dead")
				{
				in_combat = true
				}
			else
				{num++}
	if num >= instance_number(obj_enemy_parent)
		{in_combat = false}
			}
	if asset_has_any_tag(other.object_index, "container", asset_object ) && other.unlocked
		{
		if asset_has_any_tag(other.object_index, "container", asset_object) && other.unlocked
			{other.open = true}
		if lootMenu == undefined {lootMenu = instance_create_layer(0, 0,"Instances", obj_gui_loot_menu)}
		lootMenu.inventory = other.inventory
		lootMenu.inv_x = other.guix + other.sprite_width/2*global.screenRatio
		lootMenu.inv_y = other.guiy + other.sprite_height/2*global.screenRatio
		lootMenuOwner = other
		if in_combat && !asset_has_any_tag(other.object_index, "container", asset_object)
			{
			lootMenu.can_loot = true
			}
		lootMenu.update_owner(lootMenuOwner)
		}
	else if !in_combat or global.activate_key
		{
		if lootMenu == undefined {lootMenu = instance_create_layer(0, 0,"Instances", obj_gui_loot_menu)}
		lootMenu.inventory = other.inventory
		lootMenu.inv_x = other.guix
		lootMenu.inv_y = other.guiy
		lootMenuOwner = other
		if in_combat && !asset_has_any_tag(other.object_index, "container", asset_object)
			{
			lootMenu.can_loot = true
			}
		lootMenu.update_owner(lootMenuOwner)
		}
	}