/// @desc Checks if a value matches any of the other values
/// @arg {Any} value The value to check
/// @arg {Any} ... Values to compare against
function is_any() {
	var value = argument[0]
	for (var i = 1; i < argument_count; i++) {
		if (value == argument[i]) return true
	}
	
	return false
}