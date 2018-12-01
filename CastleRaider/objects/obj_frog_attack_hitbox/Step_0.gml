// cycle through all the players and see if they were hit
with (instance_place(x, y, obj_player)) {
	if (!hurt) {
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
	}
}

// enable death at beginstep
die = true;