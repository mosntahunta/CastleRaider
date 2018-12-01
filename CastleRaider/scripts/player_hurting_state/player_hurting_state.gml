///
/// player hurting state
///

// key input
get_input();

// movement
vertical_speed += global.grav;

// drag
horizontal_speed = lerp(horizontal_speed, 0, drag);

// stop
if( abs(horizontal_speed) <= 0.1 ) horizontal_speed = 0;

// set to first frame and stop if animation has played once
if (on_ground()) {
	if (image_index > image_number - image_speed) {
		image_index = 0;
		image_speed = 0;
	}
}

var recover_time = 0.4; // instant recover

if (alarm[HURT] < hurt_time * recover_time) {
	if (on_ground()) {
		state = states.IDLE;
	} else {
		state = states.JUMP;
	}
	image_speed = 1;
}


// apply movement
collision();

// apply animation
animation();