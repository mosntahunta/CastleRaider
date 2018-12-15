///
/// player game end state
///

// key input

// stop
if( abs(horizontal_speed) <= 0.1 ) horizontal_speed = 0;

// check state after animation
if (image_index >= image_number - 1) {
	image_speed = 0;
	if lives <= 0 {
		obj_game.game_over_lose = true;
	} else {
		get_input();
		if (jump or attack) and (obj_game.game_over_won_delay < -room_speed) {
			game_restart();
		}
	}
}

// apply movement
collision();

// apply animation
animation();