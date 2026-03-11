/// @desc Creates a 2D vector with x and y components.
/// @param {Real} x The x component of the vector
/// @param {Real} y The y component of the vector
function vec2(x, y) constructor {
	self.x = x
	self.y = y
	
	static add = function(vector) {
		return new vec2(x + vector.x, y + vector.y)
	}
	
	static mult = function(magnitude) {
		return new vec2(x*magnitude, y*magnitude)
	}
}

// this is a little trick i like to use (fake enum moment)
// you get enum-like auto completions when typing directions. and you can access the x and y components of the direction :nerd_emoji:
#macro directions global.dir
global.dir = {
	left: new vec2(-1,0),
	right: new vec2(1,0),
	up: new vec2(0,-1),
	down: new vec2(0,1)
}