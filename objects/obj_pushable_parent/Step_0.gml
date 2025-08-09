depth = -y
xspd = 0
yspd = 0
var xLoc = x + sprite_width/2
var yLoc = y + sprite_height/2

//move based on touching player or other pushable
var speeded = false
for (var i = 1; i < 5; i++)
	{
	if i == 1 {var object = obj_player}
	else {var object = instance_nth_nearest(x, y, obj_pushable_parent, i)}
	
	if distance_to_object(object) <= 1
		{
		if object.object_index == obj_player {xspd = object.xspd; yspd = object.yspd; speeded = true
			
			switch object.face
			{
			case UP: xspd = 0
				if object.x > xLoc + sprite_width/2 - 1 && object.x < xLoc - sprite_width/2 + 1
					{yspd = 0}
				if object.y < yLoc + sprite_height/2 - 2
					{yspd = 0}
					break;
			case DOWN: xspd = 0
				if object.x > xLoc + sprite_width/2 - 1 && object.x < xLoc - sprite_width/2 + 1
					{yspd = 0}
				if object.y > yLoc - sprite_height/2 + 2
					{yspd = 0}
					break;
			case LEFT: yspd = 0
				if object.y > yLoc + sprite_height/2 - 1 && object.y < yLoc - sprite_height/2 + 1
					{xspd = 0}
				if object.x < xLoc + sprite_width/2
					{xspd = 0}
					break;
			case RIGHT: yspd = 0
				if object.y > yLoc + sprite_height/2 - 1 && object.y < yLoc - sprite_height/2 + 1
					{xspd = 0}
				if object.x > xLoc - sprite_width/2
					{xspd = 0}
					break;
			}
			}
		else if !speeded
			{xspd = object.xspd; yspd = object.yspd; speeded = true}
	
		
		
		}
	}

//collisions
if place_meeting(x + xspd, y, global.wall_list) == true
	{
	xspd = 0;
	}
if place_meeting(x, y + yspd, global.wall_list) == true
	{
	yspd = 0;
	}

x += xspd;
y += yspd;

if xspd != 0 or yspd != 0
	{obj_setup_pathway.repath()}