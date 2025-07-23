function scr_stacking(item, stack)
	{
	for (var e = 1; e < array_length(stack); e += 1)
		{
		if stack[e][0].name == item.name
			return e
		}
	return -1
	}