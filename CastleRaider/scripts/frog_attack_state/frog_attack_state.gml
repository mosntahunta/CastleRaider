// frog attack state

// get inputs

// calculate movements

// set the tongue depth

depth = layer_get_depth(layer_get_id("Player")) - 1;

// modify state
if (image_index >= image_number - image_speed) {
	state = frog_states.IDLE;
	alarm[CAN_ATTACK] = attack_delay;
	layer_get_depth(layer_get_id("Enemy"));
}

// apply movements
collision();

// animation
frog_animation();