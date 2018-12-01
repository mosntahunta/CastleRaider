///
/// player knockback state
///

// key input
get_input();

// movement
vertical_speed += global.grav;

// drag
horizontal_speed = lerp(horizontal_speed, 0, drag);

// stop
if( abs(horizontal_speed) <= 0.1 ) horizontal_speed = 0;

// check state after animation
if (image_index >= image_number - image_speed and horizontal_speed == 0) {
	// change state
	if block {
		if down state = states.CROUCH_BLOCK else state = states.BLOCK;
	} else {
		state = states.IDLE;
	}
}

// apply movement
collision();

// apply animation
animation();