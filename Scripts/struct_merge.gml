/// @desc Merges the properties from the override struct into the base struct. Modifies the base struct in place.
/// @param {Struct} base The target struct to merge properties into
/// @param {Struct} override The source struct containing properties to merge from
function struct_merge(base, override) {
	var names = struct_get_names(override)
	var n = array_length(names)
	
	if (n <= 0) return base
	
	for (var i = 0; i < n; i++) {
		var key = names[i]
		var value = override[$ key]
		
		base[$ key] = value 
	}
	
	return base
}