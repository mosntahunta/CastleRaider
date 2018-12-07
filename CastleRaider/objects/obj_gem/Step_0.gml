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
if (y > room_height) {
	instance_destroy();
}

// generate sparks
if (die) {
	repeat(obj_game.gem_sparks) {
		inst = instance_create_depth(x, y, depth, obj_spark);
		
		// set colour
		switch(image_index) {
			case 0:
				var col_head = c_lime;
				var col_tail = make_color_rgb(137, 190, 133); // tail is lighter
			break;
			case 1:
				var col_head = c_yellow;
				var col_tail = make_color_rgb(218, 215, 152);
			break;
			case 2:
				var col_head = c_aqua;
				var col_tail = make_color_rgb(152, 193, 218);
			break;
			case 3:
				var col_head = c_fuchsia;
				var col_tail = make_color_rgb(200, 152, 218);
			break;
			case 4:
				var col_head = c_red;
				var col_tail = make_color_rgb(220, 154, 154);
			break;
		}
		
		inst.head_colour = col_head;
		inst.tail_colour = col_tail;
	}
	instance_destroy();
}
	

// collision
collision();

// update the light's position
with(light_id) {
	x = other.x;
	y = other.y;
}