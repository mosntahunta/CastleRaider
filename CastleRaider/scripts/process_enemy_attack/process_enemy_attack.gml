/// @desc process_enemy_attack( hurt_knockback, block_knockback )
/// @arg hurt_knockback_def_-1
/// @arg block_knockback_def_-1

var hurt_knockback = argument0;
var block_knockback = argument1;

// set some default values

if (hurt_knockback == -1) {
	hurt_knockback = 4;
}

if (block_knockback == -1) {
	block_knockback = 2.5;
}

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
				
		// move the object back when hit
		horizontal_speed = -facing * hurt_knockback;
		
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
			
			// move the object back when hit
			horizontal_speed = sign(x - other.x) * block_knockback;
		}
	}
}