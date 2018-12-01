// frog land state

// get inputs

// calculate movements
calculate_entity_movement();

if (image_index >= image_number - image_speed) {
	state = frog_states.IDLE;
	image_index = 0;
	image_speed = 0;
}

// modify state

// apply movements
collision();

// animation