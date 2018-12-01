// frog idle state
breathing();

// get inputs

// calculate movements
calculate_entity_movement();

// modify state
// attack
var detect_player_dis = 40;
var player_alert = false; // player is infront and in range but the attack is not ready

// player is within the distance, facing the player
// and can attack, then we can attack
if (distance_to_object(obj_player) < detect_player_dis and sign(obj_player.x - x) == facing) {
	if (can_attack) {
		// attack
		can_attack = false;
		state = frog_states.ATTACK;
	
		image_index = 0;
		image_speed = 1;
	}
	player_alert = true;
}

if (jump_timer < 0 and !player_alert) {
	jump_timer = jump_timer_initial;
	// do we jump
	var jump = random(1);
	
	if (jump > jump_chance) {
		state = frog_states.JUMP_START;
		
		// reset breath values 
		image_index = 0;
		image_speed = 1;
		
		max_horizontal_speed = max_hsp_initial;
		
		var turned = false;
		// look for solid 1 tile ahead
		var t1 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size, bbox_bottom);
		
		if (t1 == SOLID) {
			facing *= -1;
			turned = true;
		}
		
		// look for void 1 tile ahead
		var t2 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size, bbox_bottom + 1);
		
		if (t2 == VOID) {
			if (!turned) {
				facing *= -1;
			}
		}
		
		// look for void multiple tiles ahead
		for(var i = 3; i > 0; i--) {
			var t2 = tilemap_get_at_pixel(global.map, x + sign(facing) * global.tile_size * i, bbox_bottom + 1);
		
			if (t2 == VOID) {
				// find the furthest jump point
				
				var tile_start_x = (x + sign(facing) * global.tile_size * i) -
									(x + sign(facing) * global.tile_size * i) mod global.tile_size;
									
				// half the mask
				var half_mask = (bbox_right + 1 - bbox_left) / 2;
				
				if (facing) {
					var target_x = tile_start_x - half_mask;
				} else {
					var target_x = tile_start_x + half_mask + global.tile_size;
				}
				
				// adjust max hsp to land at target
				// speed = distance / time
				// how long is the frog in air = 48 steps
				var steps_in_air = 48;
				max_horizontal_speed = abs(target_x - x) / steps_in_air;
			}
		}
	}
} else {
	jump_timer--;
}

// apply movements
collision();

// animation
frog_animation();