// apply animation
image_xscale = facing;
sprite_index = sprites_array[state];
//mask_index = mask_array[state];

switch(state) {
	case states.JUMP:
		if (vertical_speed < 0) image_index = 0; else image_index = 1;
	break;
}