// cycle through all the players and see if they were hit
with (instance_place(x, y, obj_player)) {
	if (!hurt) {
		if (!block or (block and sign(x - other.x) == facing) ) {
			hurt = true;
		
			// face the enemy
			facing = sign(other.x - x);
		
			if (facing == 0) {
				facing = 1;
			}
		
			// ensure the enemy faces the player
			other.facing = -facing;
				
			// move the player back when hit
			var knockback_distance = 5;
			horizontal_speed = -facing * knockback_distance;
		
			hp--;
			
			alarm[HURT] = hurt_time;
		
			// change state
			state = states.HURTING;
			image_index = 0;
		} else {
			// blocking damage
			if (state != states.KNOCKBACK) {
				state = states.KNOCKBACK;
				image_index = 0;
				image_speed = 1;
				
				// precision with decimal is important here
				hsp_decimal = 0;
				
				var knockback_distance = 2.5;
				horizontal_speed = sign(x - other.x) * knockback_distance;
			}
		}
	}
}

// enable death at beginstep
die = true;