var hbx = guix - 4*global.screenRatio
var hby = guiy - 7*global.screenRatio

if currHealth < maxHealth
	{draw_healthbar(hbx, hby, hbx + 18*global.screenRatio, hby + 5, (currHealth/maxHealth)*100, c_white, c_maroon, c_red, 0, false, true)}