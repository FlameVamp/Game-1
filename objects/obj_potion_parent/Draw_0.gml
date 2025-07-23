//color replacement shader
shader_set(sh_replace_color)
shader_set_uniform_f(uniform_range, 1)
for (var i = 0; i < array_length(colorMatch); i += 1) {

	shader_set_uniform_f(uniform_match[i], 
		colorMatch[i].toShaderValue(colorMatch[i].red),
		colorMatch[i].toShaderValue(colorMatch[i].green),
		colorMatch[i].toShaderValue(colorMatch[i].blue))
	
	shader_set_uniform_f(uniform_replace[i], 
		colorReplace[i].toShaderValue(colorReplace[i].red),
		colorReplace[i].toShaderValue(colorReplace[i].green),
		colorReplace[i].toShaderValue(colorReplace[i].blue))
		

	}
	
draw_self()

shader_reset()