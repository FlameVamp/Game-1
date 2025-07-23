// Inherit the parent event
event_inherited();

name = "Moderate Magicka Potion"

for (var i = 0; i < array_length(colorMatch); i += 1) {
	colorReplace[i].red = colorMatch[i].blue
	colorReplace[i].green = colorMatch[i].green
	colorReplace[i].blue = colorMatch[i].red
	}