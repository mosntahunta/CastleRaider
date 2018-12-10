///
/// player die state
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
if (image_index >= image_number - 1) {
	show_debug_message("dying");
	image_speed = 0;
	if lives <= 0 {
		show_debug_message("lose");
		obj_game.game_over_lose = true;
	} else {
		get_input();
		if jump or attack {
			room_restart();
			// reset player
			x = room_start_position_x;
			y = room_start_position_y;
			facing = room_start_facing;
			state = states.IDLE;
			image_speed = 1;
			hp = max_hp;
			// allow instant camera panning
			with(obj_camera) {
				camera_pan_speed = 1;
				// reset camera pan speed
				alarm[CAMERA_RESET] = 3;
			}
		}
	}
}

// apply movement
collision();

// apply animation
animation();