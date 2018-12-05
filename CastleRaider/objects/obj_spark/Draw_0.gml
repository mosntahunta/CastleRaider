// draw line
// set blend mode
gpu_set_blendmode(bm_add);

// draw head
draw_set_color(head_colour);
draw_line_width(xp, yp, x, y, min(abs(speed), 1) * line_width);

// draw tail
draw_set_color(tail_colour);
draw_line_width(xpp, ypp, xp, yp, min(abs(speed), 1) * line_width);

// draw lighting
draw_circle_color(x, y, speed, merge_color(c_black, head_colour, speed * intensity), c_black, 0);

// reset blendmode
gpu_set_blendmode(bm_normal);

// update variables for the next step
xpp = xp;
ypp = yp;

xp = xprevious;
yp = yprevious;

// update direciton
direction += direction_change;
direction_change *= dir_change_decay;

// update speed
speed *= speed_decay;

// destroy object
if (abs(speed) < 0.1) {
	instance_destroy();
}