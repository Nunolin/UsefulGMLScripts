/// @desc Gets a nested value from a struct using a dot path. Returns undefined if any intermediate path segment doesn't exist, preventing crashes.
/// @arg {Struct} struct The root struct to start traversing from
/// @arg {string} string_path Dot-separated path string (e.g., "system.shop.buy")
function struct_path_get(struct, string_path) {
	var parts = string_split(string_path, ".")
	
	var current_level = struct
	for (var i = 0, n = array_length(parts); i < n; i++) {
		if (!is_struct(current_level) || is_undefined(current_level)) return undefined
		
		current_level = struct_get(current_level, parts[i])
	}
	
	return current_level
}
