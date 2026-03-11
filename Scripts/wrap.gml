/// @desc Wraps a value within a specified range (exclusive max)
/// @param {Real} val The value to wrap
/// @param {Real} min The minimum bound (inclusive)
/// @param {Real} max The maximum bound (exclusive)
function wrap(val, min, max) {
	if (val < min) val = max - 1
	else if (val >= max) val = min
	
	return val
}