guix = (x - camera_get_view_x(view_camera[0]))*global.screenRatio
guiy = (y - camera_get_view_y(view_camera[0]))*global.screenRatio

if array_length(inventory) == 0
	{
	instance_destroy(self)
	}
depth = -y