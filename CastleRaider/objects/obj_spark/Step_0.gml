// bounce off solids
// horizontal check
var t1 = tilemap_get_at_pixel(global.map, x + hspeed, y);
if (t1 == SOLID or t1 == DEATH) {
	hspeed *= -1;
}

t1 = tilemap_get_at_pixel(global.map, x, y + vspeed);
// vertical check
if (t1 == SOLID or t1 == DEATH) {
	vspeed *= -1;
}