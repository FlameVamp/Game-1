name = "Unnamed"
weight = 0
description = "No description added"
stackable = true

//item type
if asset_has_any_tag(object_index, "potion", asset_object)	{type = "Potion"}
else if asset_has_any_tag(object_index, "armor", asset_object)	{type = "Armor" stackable = false}
else if asset_has_any_tag(object_index, "weapon", asset_object)	{type = "Weapon" stackable = false}
else if asset_has_any_tag(object_index, "consumable", asset_object)	{type = "Consumable"}
else {type = "Misc"}