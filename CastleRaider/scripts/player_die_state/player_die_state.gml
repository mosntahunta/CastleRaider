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
	image_speed = 0;
	if lives <= 0 {
		obj_game.game_over_lose = true;
	} else {
		// restart message
		show_msg("Press jump to restart", 1);
		get_input();
		if jump or attack {
			// start fading to black when restarting
			fade_to_room(room, room_start_position_x, room_start_position_y, room_start_facing, c_black);
			
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