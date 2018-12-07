gpu_set_blendmode(bm_add);

var _radius = 0;
var _intensity = 0;
if flickering {
	_radius = random_range(2, 4);
	_intensity = random(.12);
}

if circle {
	draw_circle_color(x, y, radius + _radius, merge_color(c_black, colour, intensity + _intensity), c_black, 0);
} else {
	// ellipse
	var width = abs(sprite_width) * .75;
	var height = abs(sprite_height) + abs(sprite_height) * .75;
	draw_ellipse_color(x - width, y - height, x + width, y + height, merge_color(c_black, colour, intensity + _intensity), c_black, 0);
}
gpu_set_blendmode(bm_normal);
