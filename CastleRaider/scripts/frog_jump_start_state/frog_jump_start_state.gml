// frog jump start state

// check health
check_enemy_hp();

// get inputs

// calculate movements
calculate_entity_movement();

// modify state
if (image_index >= image_number - image_speed) {
	state = frog_states.JUMP;
	vertical_speed = jump_speed;
	
	if on_screen(40) {
		audio_play_sound(snd_frog_jump, 20, false);
	}
}

// apply movements
collision();

// animation
frog_animation();