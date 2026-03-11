/// @desc Returns a random element from an array
/// @param {Array} array The array to select a random element from
function array_random(array){
	return array[irandom(array_length(array)-1)]
}