// frog attack state

// check health
check_enemy_hp();

// get inputs

// calculate movements
calculate_entity_movement();

// set the tongue depth

// modify state

// attack warning
if (image_index == 2 and !inhale) {
	inhale = true;
	alarm[INHALE] = inhale_timer;
	image_speed = 0;
}

if (attack) {
	if (image_index >= 5 and image_index <= 6) {
		// create the hitbox
		var inst = instance_create_layer(x, y, "Enemy", obj_frog_attack_hitbox);
		// ensure the hitbox faces the way the frog that created it is facing
		inst.image_xscale = facing;
	}
	
	// set tongue depth
	depth = layer_get_depth(layer_get_id("Player")) - 1;
	
	if (image_index >= image_number - image_speed) {
		state = frog_states.IDLE;
		alarm[CAN_ATTACK] = attack_delay;
		layer_get_depth(layer_get_id("Enemy"));
		inhale = false;
		attack = false;
	}
}

// apply movements
collision();

// animation
frog_animation();