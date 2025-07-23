inventory = undefined

owner = undefined

clip_surface = undefined
spriteSize = 20*global.screenRatio
view_w = spriteSize * 5
view_h = spriteSize * 3

inv_x = 0
inv_y = 0

items_x = 0
items_y = 0
stack = undefined

yy = 0

wait = false
waitTime = 5
ogwaitTime = waitTime
can_loot = false


//updating the owner of the loot menu and redoing the stack accordingly
function update_owner(new_owner)
	{
	if new_owner != owner
		{
		owner = new_owner; stack = reStack(inventory, yy)
		if obj_player.in_combat && !asset_has_any_tag(owner.object_index, "container", asset_object)
			{can_loot = false}
		else
			{can_loot = true}	
		}
	}