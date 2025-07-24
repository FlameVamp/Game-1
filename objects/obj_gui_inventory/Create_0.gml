//set font
draw_set_font(Font1)

//inventory tabs; WIP
inv_tab = "inventory"

depth = 100

rowLength = 6
inventory = array_create(0, -1)
if !layer_exists("items")
	{layer_create(100, "items")}
inventory[12] = instance_create_layer(0, 0, "items", obj_item_test)
inventory[0] = instance_create_layer(0, 0, "items", obj_iron_sword)
inventory[1] = instance_create_layer(0, 0, "items", obj_iron_helmet)
inventory[13] = instance_create_layer(0, 0, "items", obj_light_health_potion)
inventory[14] = instance_create_layer(0, 0, "items", obj_light_health_potion)
inventory[2] = instance_create_layer(0, 0, "items", obj_iron_cuirass)
inventory[3] = instance_create_layer(0, 0, "items", obj_iron_greaves)
inventory[4] = instance_create_layer(0, 0, "items", obj_iron_boot_right)
inventory[5] = instance_create_layer(0, 0, "items", obj_iron_boot_left)
inventory[6] = instance_create_layer(0, 0, "items", obj_iron_gauntlet_right)
inventory[7] = instance_create_layer(0, 0, "items", obj_iron_gauntlet_left)
inventory[8] = instance_create_layer(0, 0, "items", obj_iron_pauldron_right)
inventory[9] = instance_create_layer(0, 0, "items", obj_iron_pauldron_left)
inventory[10] = instance_create_layer(0, 0, "items", obj_item_test)
inventory[11] = instance_create_layer(0, 0, "items", obj_moderate_magicka_potion)

loot_bag = undefined

inv_x = 0
inv_y = 0
items_x = 0
items_y = 0
yy = 0

selectedItem = undefined

popup = undefined

currentViewport = view_camera[0]
global.screenRatio = (display_get_width()/camera_get_view_width(currentViewport))

spriteSize = 20
spriteSize *= global.screenRatio

global.toggle_inv = false

clip_surface = undefined

stack = array_create(0, -1)
array_push(stack, array_create(1, -1))