function reStack(inv, yy)
	{
	var stack = array_create(0, -1)
	array_push(stack, array_create(1, -1))
	for (var i = 0; i < array_length(inv); i += 1)
		{
		var e = scr_stacking(inv[i], stack)
		if e == -1 or !inv[i].stackable
			{
			if (inv[i] != -1)
				{
				var subStack = array_create(0, -1)
				array_insert(subStack, 0, inv[i])
				array_insert(subStack, 1, 1)
				array_insert(subStack, 2, yy)
				array_push(stack, subStack)
				}
			}
		else
			{
			stack[e][1] += 1
			}
		}
	return stack
	}