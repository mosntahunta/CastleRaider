/// desc show_msg(message, secs_to_display)
/// @arg message
/// @arg secs_to_display
/// show message for required time

var _msg = argument0;
var _time = argument1;

with(obj_game) {
	alarm[DISPLAY_MSG] = _time * room_speed;
	msg = _msg;
}
