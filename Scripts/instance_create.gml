/// @desc Creates an instance of an object for when the position nor depth matter
/// @param {Asset.GMObject} obj The object
/// @param {Struct} [vars] Variable definitions
function instance_create(obj, vars = {}) {
	return instance_create_depth(0, 0, 0, obj, vars)
}