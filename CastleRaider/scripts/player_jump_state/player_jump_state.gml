///
/// player jump state
///

// key input
get_input();

// movement
calculate_movement();

// check if we can move out of the state
if( on_ground() ) {
	if( horizontal_speed != 0 ) {
		state = states.WALK;
	} else {
		state = states.IDLE;
	}
}

if( attack ) {
	state = states.ATTACK;
	image_index = 0;
}

// enable smaller jumps
if( vertical_speed < 0 && !jump_held ) {
	vertical_speed = max(vertical_speed, vertical_speed/jump_dampner);
}

// apply movement
collision();

// apply animation
animation();