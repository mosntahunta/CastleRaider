// cycle through all the enemies and see if they were hit
with (obj_enemy_parent) {
	if (distance_to_object(other) < 60) {
		if (place_meeting(x, y, other)) {
			if (!hurt) {
				hurt = true;
			
				// get sign direction from hitbox to enemy
				var _direction = sign(x - other.x);
			
				// insure the objects are not at the same x
				if (_direction == 0) {
					_direction = 1;
				}
				
				// move away from the hitbox
				var knockback_distance = 3;
				horizontal_speed = _direction * knockback_distance;
				
				// face the hitbox if onground
				if (on_ground()) {
					facing = - _direction;
				}
			
				hp--;
			
				alarm[HURT] = hurt_time;
				
				scr_screen_shake(.1, 1.5);
				
				var create = true;
				
				if (instance_exists(obj_sword_hit)) {
					with(obj_sword_hit) {
						if (image_index <= 1) {
							create = false;
						}
					}
				}
				
				if (create) {
					var inst = instance_create_depth(x, (bbox_top + bbox_bottom) / 2, depth - 1, obj_sword_hit);	
					inst.image_xscale = obj_player.facing;
					if (hp <= 0) {
						var inst = instance_create_depth(x, (bbox_top + bbox_bottom) / 2, depth - 1, obj_sword_hit);	
						inst.image_xscale = obj_player.facing;
						inst.sprite_index = spr_sword_hit2;
					}
				}
			}
		}
	}
}

// enable death at beginstep
die = true;