// frog idle state
breathing();

// get inputs

// calculate movements

// modify state
if (jump_timer < 0) {
	jump_timer = jump_timer_initial;
	// do we jump
	var jump = random(1);
	
	if (jump > jump_chance) {
		state = frog_states.JUMP_START;
		
		// reset breath values 
		image_index = 0;
		image_speed = 1;
	}
} else {
	jump_timer--;
}
// apply movements

// animation
frog_animation();