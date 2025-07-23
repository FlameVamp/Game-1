//healthbar
draw_healthbar(left, top, right + ((obj_player.maxHealth - 100)*2), bottom, (obj_player.currHealth/obj_player.maxHealth)*100, c_white, c_maroon, c_red, 0, false, true)

//stamina bar
draw_healthbar(left, bottom + 5, right + ((obj_player.maxStamina - 100)*2), bottom + 5 + barHeight, (obj_player.currStamina/obj_player.maxStamina)*100, c_white, c_green, c_lime, 0, false, true)

//magicka bar
draw_healthbar(left, bottom + 10 + barHeight, right + ((obj_player.maxMagicka - 100)*2), bottom + 10 + 2*barHeight, (obj_player.currMagicka/obj_player.maxMagicka)*100, c_white, c_navy, c_blue, 0, false, true)