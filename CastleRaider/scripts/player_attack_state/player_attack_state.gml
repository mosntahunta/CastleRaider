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

// create hitbox
if( image_index >= 1 and image_index <= 3 ) {
	var inst = instance_create_layer(x, y, "Player", obj_player_attack_hitbox);
	inst.image_xscale = facing;
	
	if image_index == 1 audio_play_sound(snd_sword_swing, 20, false);
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

// check player's hp
check_player_hp();

// apply animation
animation();