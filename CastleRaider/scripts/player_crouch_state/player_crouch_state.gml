///
/// player crouch state
///

// key input
get_input();

// movement
calculate_movement();

block_check();

if( attack )
{
	state = states.ATTACK;
	image_index = 0;
}

if( jump )
{
	jumped();
}

// apply movement
collision();

// check player's hp
check_player_hp();

// apply animation
animation();