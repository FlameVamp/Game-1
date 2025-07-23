//unlocking with connected activator object
if unlocker == undefined {unlocked = true}
else if unlocker.pressed {unlocked = true}
else {unlocked = false}

if !unlocked {open = false}

if open
	{image_index = 1}
else
	{image_index = 0}

	
guix = (x - camera_get_view_x(view_camera[0]))*global.screenRatio
guiy = (y - camera_get_view_y(view_camera[0]))*global.screenRatio