// frog idle state

// get inputs

// calculate movements
horizontal_speed += spd * facing;
vertical_speed += global.grav;

// limit speed
horizontal_speed = min(abs(horizontal_speed), max_horizontal_speed) * facing;

// modify state
// check if on ground
if( on_ground() ) {
	horizontal_speed = 0;
	state = frog_states.JUMP_LAND;
	image_index = 0;
	image_speed = 1;
}

// apply movements
collision();

// animation
frog_animation();