///
/// player walk state
///

// key input
get_input();

// movement
calculate_movement();

// check if we can move out of the state
if( horizontal_speed == 0 ) state = states.IDLE;

// check if falling off the ledge
var side = bbox_bottom;
var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + 1);
var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + 1);

if (t1 == VOID or t2 == VOID) {
	state = states.JUMP;
	number_of_jumps = 0;
}


if( attack )
{
	state = states.ATTACK;
	image_index = 0;
}

if( jump )
{
	jumped();
}

if( block )
{
	state = states.BLOCK;
	horizontal_speed = 0;
}

// apply movement
collision();

// apply animation
animation();