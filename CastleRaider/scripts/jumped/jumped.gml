//
// standard jump off the ground
//

if (on_ground()) {
	number_of_jumps = number_of_jumps_init;
}

if (number_of_jumps > 0) {
	state = states.JUMP;
	vertical_speed = jump_speed;
	number_of_jumps--;
	jump_dust();
}