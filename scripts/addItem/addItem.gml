function addItem(inv, item, stack, yy)
	{
	array_insert(inv, 0, item)
	if stack == undefined {stack = true}
	if stack
		{
		return reStack(inv, yy)
		}
	}