function object_is_ancestor_or_self(object_index1, object_index2){
	if object_index1 != object_index2 or object_is_ancestor(object_index1, object_index2)
		{return true}
	else
		{return false}
}