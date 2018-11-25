///
/// player block state
///

// key input
get_input();

// movement
calculate_movement();

if( attack )
{
	state = states.ATTACK;
	image_index = 0;
}

if( block )
{
	horizontal_speed = 0;
} else {
	if (horizontal_speed != 0) {
		state = on_ground() ? states.WALK : states.JUMP;
	} else {
		state = states.IDLE;
	}
}

if( jump ) {
	jumped();
}

// apply movement
collision();

// apply animation
animation();