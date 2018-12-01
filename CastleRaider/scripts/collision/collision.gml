//
// apply movement
//

if (horizontal_speed == 0) hsp_decimal = 0;
if (vertical_speed == 0) vsp_decimal = 0;

//
// floor decimals
//
// gamemaker allows subpixel movement which does not work with
// tilebased collisions as tiles are lined up to whole pixels
//

// apply carried over decimals
horizontal_speed += hsp_decimal;
vertical_speed += vsp_decimal;

// horizontal
hsp_decimal = horizontal_speed - (floor(abs(horizontal_speed)) * sign(horizontal_speed));
horizontal_speed -= hsp_decimal;

// vertical
vsp_decimal = vertical_speed - (floor(abs(vertical_speed)) * sign(vertical_speed));
vertical_speed -= vsp_decimal;

//
// horizontal collision
//
var side;
// determine which side to test
if (horizontal_speed > 0) {
	side = bbox_right; 
} else {
	side = bbox_left;
}

// check top and bottom of side
var t1 = tilemap_get_at_pixel(global.map,side + horizontal_speed, bbox_top);
var t2 = tilemap_get_at_pixel(global.map,side + horizontal_speed, bbox_bottom);

// collision found
// todo -> this collision is triggered when the player hits the ceiling.
if  ((t1 != VOID) and (t1 != PLATFORM)) or
	((t2 != VOID) and (t2 != PLATFORM)) {
	if(horizontal_speed > 0) {
		x = x - (x mod global.tile_size) + global.tile_size - (side - x) - 1;
	} else {
		x = x - (x mod global.tile_size) - (side - x);
	}
	horizontal_speed = 0;
}

//
// vertical collision
//
// determine which side to test
if (vertical_speed > 0) {
	side = bbox_bottom; 
} else {
	side = bbox_top;
}

// check left and right side
var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + vertical_speed);
var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + vertical_speed);
var t3 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom);
var t4 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom);

// collision found
if (t1 != VOID and ((vertical_speed > 0 or t1 != PLATFORM) and t3 != PLATFORM) or (t1 == SOLID and t3 == PLATFORM)) or
   (t2 != VOID and ((vertical_speed > 0 or t2 != PLATFORM) and t4 != PLATFORM) or (t2 == SOLID and t4 == PLATFORM)) {
	if(vertical_speed > 0) {
		y = y - (y mod global.tile_size) + global.tile_size - 1 - (side - y);
	} else {
		y = y - (y mod global.tile_size) - (side - y);
	}
	vertical_speed = 0;
}

x += horizontal_speed;
y += vertical_speed;