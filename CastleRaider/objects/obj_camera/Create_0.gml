// get dimensions
var width = camera_get_view_width(view_camera[0]);
var height = camera_get_view_height(view_camera[0]);

// create camera
camera = camera_create_view(0, 0, width, height, 0, -1, -1, -1, 128, 128);
view_set_camera(0, camera);

// camera following variables
follow = noone;
move_to_x = x;
move_to_y = y;

// how fast the camera pans
camera_pan_speed_initial = 1; // lower = slower pan
camera_pan_speed = camera_pan_speed_initial;

// reset the camera to default pan speed
alarm[CAMERA_RESET] = 3;

// screen shake
screen_shake = false;
screen_shake_amount_initial = 3; // pixels the screen will move
screen_shake_amount = screen_shake_amount_initial;

// move onto the main room
room_goto_next();
