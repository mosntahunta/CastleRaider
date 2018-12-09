// movement
horizontal_speed = spd * facing;
image_xscale = sign(horizontal_speed);

// stop if dead
if die {
	horizontal_speed = 0;
}
	

// destroy at wall if moved more than 1 tile
if abs(xstart - x) > global.tile_size {
	if sign(horizontal_speed) var side = bbox_right else var side = bbox_left;
	var t1 = tilemap_get_at_pixel(global.map, side + sign(horizontal_speed), y);
	
	if t1 == SOLID {
		// hit a wall
		die = true;
	}
	collision();
} else {
	x += horizontal_speed;
}

// play death animation
if die {
	// skip to the death animation
	if image_speed != 1 image_index = 1;
	image_speed = 1;	
}

// destroy if leaving the room
if x > room_width or x < 0 {
	instance_destroy();
}