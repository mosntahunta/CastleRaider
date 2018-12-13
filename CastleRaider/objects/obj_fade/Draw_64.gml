// get dimensions
var dw = display_get_gui_width();
var dh = display_get_gui_height();

// fade to colour
if fade_to_colour {
	alpha += fade_speed;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, dw, dh, colour, colour, colour, colour, false);
	if alpha >= 1 {
		fade_to_colour = false;
		with(obj_player) {
			// set player's starting position
			room_start_position_x = other.target_x;
			room_start_position_y = other.target_y;
			x = room_start_position_x;
			y = room_start_position_y;
			
			// set facing direction
			room_start_facing = other.facing;
			facing = room_start_facing;
			
			// reset values
			horizontal_speed = 0;
			vertical_speed = 0;
			hsp_decimal = 0;
			vsp_decimal = 0;
			scale_x = 1;
			scale_y = 1;
			
			// reset player if dead
			if state = states.DIE {
				image_speed = 1;
				hp = max_hp;
			}
			
			// change start and update animation
			state = states.IDLE;
			animation();
		}
		// pan the camera quickly
		obj_camera.camera_pan_speed = 1;
		room_goto(target_room);	
	}
} else {
	// fade from colour
	alpha -= fade_speed;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, dw, dh, colour, colour, colour, colour, false);
	if alpha <= 0 {
		// reset camera pan speed
		obj_camera.camera_pan_speed = obj_camera.camera_pan_speed_initial;
		instance_destroy();
	}
}
draw_set_alpha(1);