// Inherit the parent event
event_inherited();
stackable = true

healHealth = false
healStamina = false
healMagicka = false

healAmount = 0


//color replacement
Color = function(r, g, b) constructor {
	red = r
	green = g
	blue = b
	
	static toShaderValue = function(value) {
		return value / 255
		}
	}

colorMatch = array_create(0, -1)
colorReplace = array_create(0, -1)

colorMatch[0] = new Color(216, 25, 31)
colorReplace[0] = new Color(216, 25, 31)

colorMatch[1] = new Color(224, 26, 33)
colorReplace[1] = new Color(224, 26, 33)

colorMatch[2] = new Color(238, 28, 36)
colorReplace[2] = new Color(238, 28, 36)

colorMatch[3] = new Color(255, 29, 36)
colorReplace[3] = new Color(255, 29, 36)

colorMatch[4] = new Color(255, 63, 70)
colorReplace[4] = new Color(255, 63, 70)

uniform_range = shader_get_uniform(sh_replace_color, "range")

uniform_match = array_create(0, -1)
uniform_replace = array_create(0, -1)

for (var i = 0; i < 5; i++) {
    uniform_match[i] = shader_get_uniform(sh_replace_color, "colorMatch" + string(i));
    uniform_replace[i] = shader_get_uniform(sh_replace_color, "colorReplace" + string(i));
}