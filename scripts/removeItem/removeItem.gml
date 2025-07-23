function removeItem(inv, item, stack, yy)
	{
	array_delete(inv, array_get_index(inv, item), 1)
	if stack == undefined {stack = true}
	if stack
		{return reStack(inv, yy)}
	}