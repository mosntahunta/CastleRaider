// frog attack state

// get inputs

// calculate movements

// set the tongue depth

// modify state

// attack warning
if (image_index == 2 and !inhale) {
	inhale = true;
	alarm[INHALE] = inhale_timer;
	image_speed = 0;
}

if (attack) {
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