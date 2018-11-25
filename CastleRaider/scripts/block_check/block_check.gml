if( block )
{
	if( down ) {
		state = states.CROUCH_BLOCK;
	} else {
		state = states.BLOCK;
	}
	horizontal_speed = 0;
} else {
	// leaving the block state
	if( down ) {
		state = states.CROUCH;
	} else {
		if (horizontal_speed != 0) {
			state = on_ground() ? states.WALK : states.JUMP;
		} else {
			state = states.IDLE;
		}
	}
}