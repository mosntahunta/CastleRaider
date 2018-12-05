// move towards move_to_x and move_to_y

x = lerp(x, move_to_x, camera_pan_speed);
y = lerp(y, move_to_y, camera_pan_speed);

// camera has to be pointing at the center of the object it is following.
// by default, x and y indicates the object is at the top-left corner of the camera's view.
camera_set_view_pos(camera, x - camera_get_view_width(camera) / 2, y - camera_get_view_height(camera) / 2);

// the object origin is usually set at the bottom-centre of its position.
if (follow != noone) {
	move_to_x = follow.x;
	var buffer = global.tile_size / 2;
	move_to_y = follow.y - buffer;
}

// clamp the camera's view position so that it won't be pointing beyond the room's view boundaries.
var xx = clamp(camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera));
var yy = clamp(camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera));

// screen shake
if (screen_shake) {
	xx += random_range(-screen_shake_amount, screen_shake_amount);
	yy += random_range(-screen_shake_amount, screen_shake_amount);
}

camera_set_view_pos(camera, xx, yy);

// background scrolling
var layer_id = layer_get_id("Background");
layer_x(layer_id, lerp(0, camera_get_view_x(view_camera[0]), 0.7));
layer_y(layer_id, lerp(0, camera_get_view_y(view_camera[0]), 0.4));