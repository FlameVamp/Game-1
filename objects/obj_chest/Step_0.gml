//unlocking with connected activator object

for (var i = 0; i < array_length(unlocker); i++)
	{
	if unlocker[i].pressed {unlocked = true}
	else {unlocked = false; break}
	}

if !unlocked {open = false}

if open
	{image_index = 1}
else
	{image_index = 0}

	
guix = (x - camera_get_view_x(view_camera[0]))*global.screenRatio
guiy = (y - camera_get_view_y(view_camera[0]))*global.screenRatio