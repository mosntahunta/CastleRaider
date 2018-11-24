///
/// player attack state
///

// key input
get_input();

// movement
calculate_movement();

// check if we can move out of the state
if( image_index >= image_number - image_speed ) {
	if( horizontal_speed != 0 ) {
		state = states.WALK;
	} else {
		state = states.IDLE;
	}
}

// apply movement
collision();

// apply animation
animation();