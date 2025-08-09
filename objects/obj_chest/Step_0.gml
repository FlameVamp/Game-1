//unlocking with connected activator object

var count = 0
var unlock = true
for (var i = 0; i < array_length(unlocker); i++)
	{
	if array_contains(unlocker[i].negative, id)
		{
		if !unlocker[i].pressed {count += 1}
		else {unlock = false}
		}
	else
		{
		if unlocker[i].pressed {count += 1}
		else {unlock = false}
		}
	}

if !unlocked {open = false}

if open
	{image_index = 1}
else
	{image_index = 0}

	
guix = (x - camera_get_view_x(view_camera[0]))*global.screenRatio
guiy = (y - camera_get_view_y(view_camera[0]))*global.screenRatio