/// @desc on_screen(buffer);
/// @arg buffer
/// is the object on the screen

var buffer = argument0;
var left = global.cx - buffer;
var right = global.cx + global.cw + buffer;
var top = global.cy - buffer;
var bottom = global.cy + global.ch + buffer

if x > left and x < right and y > top and y < bottom {
	return true;
} else {
	return false;
}
