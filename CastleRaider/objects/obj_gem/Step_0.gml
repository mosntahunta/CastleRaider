// movement
calculate_entity_movement();

// bounce
if (on_ground() && !bounce) {
	vertical_speed = vertical_speed_initial * random_range(0.7, 0.8);
	can_pickup = true;
	bounce = true;
}

var side = 0;
// bouncing off walls
if (sign(horizontal_speed_initial)) {
	side = bbox_right;
} else {
	side = bbox_left;
}

var t1 = tilemap_get_at_pixel(global.map, side + sign(horizontal_speed_initial), bbox_bottom);
if (t1 == SOLID) {
	// wall found, reverse direction
	horizontal_speed = -horizontal_speed_initial * 0.75;
}

// destroy gem if falls out of room
if (die or y > room_height) {
	instance_destroy();
}

// collision
collision();