var take_damage = false;

// only do this if arrow is not set to die
if !other.die {
	// if player is looking away
	if facing == other.facing {
		take_damage = true;
	} else {
		if block {
			if down {
				// blocking and crouching
				other.die = true;
			} else {
				// blocking and not crouching
				take_damage = true;
			}
		} else {
			// not blocking
			take_damage = true;
		}
	}
	// don't take damage if already dead
	if hp <= 0 {
		take_damage = false;
	}
	
	// process the damage
	if take_damage {
		if !hurt {
			hurt = true;
			hp--;
			alarm[HURT] = hurt_time;
			scr_screen_shake(.125, -1);
		} else {
			other.die = true;
		}
	}	
}
			