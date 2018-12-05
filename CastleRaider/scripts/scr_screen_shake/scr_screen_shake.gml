// screen_shake(seconds_to_shake, shake_amount)
// @arg seconds_to_shake
// @arg shake_amount
var time = argument0;
var amount = argument1;

with (obj_camera) {
	if amount == -1 {
		amount = screen_shake_amount_initial;
	}
	screen_shake = true;
	alarm[SCREEN_SHAKE_TIME] = room_speed * time;
	screen_shake_amount = amount;
}
	

