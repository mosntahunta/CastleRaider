///
/// player attack state
///

// key input
get_input();

// movement
calculate_movement();

// check if we can move out of the state
if( image_index >= image_number - image_speed ) {
	if( !on_ground() ) state = states.JUMP;
	if( horizontal_speed != 0 ) {
		state = states.WALK;
	} else {
		state = states.IDLE;
	}
}

// enable double jumps
if( jump ) {
	jumped();
	state = states.ATTACK;
}

// enable smaller jumps
if( vertical_speed < 0 && !jump_held ) {
	vertical_speed = max(vertical_speed, vertical_speed/jump_dampner);
}

// apply movement
collision();

// apply animation
animation();