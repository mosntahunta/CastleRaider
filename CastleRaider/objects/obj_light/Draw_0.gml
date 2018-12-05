gpu_set_blendmode(bm_add);

if circle {
	draw_circle_color(x, y, radius, merge_color(c_black, colour, intensity), c_black, 0);
} else {
	// ellipse
	var width = abs(sprite_width) * .75;
	var height = abs(sprite_height) + abs(sprite_height) * .75;
	draw_ellipse_color(x - width, y - height, x + width, y + height, merge_color(c_black, colour, intensity), c_black, 0);
}
gpu_set_blendmode(bm_normal);
