///
/// player walk state
///

// key input
get_input();

// movement
calculate_movement();

// check if we can move out of the state
if( horizontal_speed == 0 ) state = states.IDLE;

if( attack )
{
	state = states.ATTACK;
	image_index = 0;
}

// apply movement
collision();

// apply animation
animation();