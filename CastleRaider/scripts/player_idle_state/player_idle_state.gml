///
/// player idle state
///

// key input
get_input();

// movement
calculate_movement();

// check if we can move out of the state
if( horizontal_speed != 0 ) state = states.WALK;

if( attack )
{
	state = states.ATTACK;
	image_index = 0;
}

if( jump )
{
	jumped();
}

if( block )
{
	state = states.BLOCK;
	horizontal_speed = 0;
}

if( down )
{
	state = states.CROUCH;
	horizontal_speed = 0;
}

// apply movement
collision();

// check player's hp
check_player_hp();

// apply animation
animation();