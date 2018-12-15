//
// standard jump off the ground
//

if (on_ground()) {
	number_of_jumps = number_of_jumps_init;
}

if (number_of_jumps > 0) {
	scale_x = scale_min;
	scale_y = scale_max;
	
	state = states.JUMP;
	vertical_speed = jump_speed;
	number_of_jumps--;
	jump_dust();
	audio_play_sound(snd_jump, 15, false);
}