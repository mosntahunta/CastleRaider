// frog idle state

// get inputs

// calculate movements
calculate_entity_movement();

// horizontal movement
horizontal_speed += spd * facing;

// limit speed
horizontal_speed = min(abs(horizontal_speed), max_horizontal_speed) * facing;

// modify state
// check if on ground
if( on_ground() ) {
	horizontal_speed = 0;
	state = frog_states.JUMP_LAND;
	image_index = 0;
	image_speed = 1;
}

// apply movements
collision();

// animation
frog_animation();