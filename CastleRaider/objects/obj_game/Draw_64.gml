// 720 x 360
// get gui dimensions
var gw = display_get_gui_width();
var gh = display_get_gui_height();
if room != rm_menu {
	// gems
	#region
	draw_set_font(font_stats);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	var colour = make_color_rgb(173, 144, 159);
	draw_set_color(colour);
	#endregion

	// set draw location
	#region
	var xx = gw - 92;
	var yy = 2;

	draw_sprite(spr_gem_gui, 0, xx, yy);
	#endregion

	// text
	#region
	var text_xx = 7;
	var text_yy = 22;
	draw_set_color(c_black);
	draw_text(xx + text_xx + 1, yy + text_yy + 1, obj_player.gems );
	draw_set_color(colour);
	draw_text(xx + text_xx, yy + text_yy, obj_player.gems );
	#endregion

	// hp bar
	#region
	xx = 48;
	yy = 25;

	// draw red bar
	draw_sprite(spr_hp_bar, 1, xx, yy);
	draw_sprite_ext(spr_hp_bar, 2, xx, yy, obj_player.hp / obj_player.max_hp, 1, 0, c_white, image_alpha);
	draw_sprite(spr_hp_bar, 0, xx, yy);
	#endregion

	// lives
	#region
	xx = 48;
	yy = 32;
	var gap = 22;
	if lives > 0 {
		// draw number of lives
		for (var i = 0; i < lives; i++) {
			draw_sprite(spr_lives, 0, xx + i * gap, yy);
		}
	}
	#endregion

	// score
	#region
	xx = gw / 2;
	yy = 11;
	draw_sprite(spr_score, 0, xx, yy);
	draw_set_halign(fa_right);
	text_xx = 54;
	text_yy = 14;
	// draw shadow
	draw_set_color(c_black);
	draw_text(xx + text_xx + 1, yy + text_yy + 1, score );
	// draw text
	draw_set_color(colour);
	draw_text(xx + text_xx, yy + text_yy, score );
	#endregion

	// game over
	#region
if game_over_lose {
	// center the gui
	var mx = gw / 2;
	var my = gh / 2;
	
	draw_sprite(spr_game_over, 0, mx, my);
	draw_sprite(spr_game_over_text, 0, mx, my);
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	
	// create the array for text output
	var text;
	
	// line 1
	// gem value, number of gems, gem total
	text[0] = string(obj_player.gems_value) + " x";
	text[1] = obj_player.gems;
	var gems_total = obj_player.gems * obj_player.gems_value;
	text[2] = gems_total;
	
	// line 2
	// lives value, number of lives, lives total
	text[3] = string(obj_player.lives_value) + " x";
	text[4] = lives;
	var lives_total = lives * obj_player.lives_value;
	text[5] = lives_total;
	
	// line 3
	// blank, "score", score
	text[6] = "";
	text[7] = "Score";
	text[8] = score;
	
	// line 3
	// blank, "total score", score
	text[9] = "";
	text[10] = "Total Score";
	var total_score = score + gems_total + lives_total;
	text[11] = total_score;
	
	if total_score > highscore {
		highscore = total_score;
		ini_open(save_name);
		ini_write_real("Score", "Highscore", highscore);
		ini_close();
	}
	
	// set starting position
	var xx = mx - 10;
	var yy = my - 32;
	// set gaps
	var gap_c = 40;
	var gap_r = 30;
	// what line we are on
	var line = 0;
	var rows = 4;
	var columns = 3;
	
	for(var j = 0; j < rows; j++) {
		for(var i = 0; i < columns; i++) {
			draw_text(xx + i * gap_c, yy, text[i + line * columns]);
		}
		yy += gap_r;
		line++;
		// move down extra for the last line
		if j == 2 {
			yy += gap_r / 3;
		}
	}
}
#endregion
} else {
	// draw main menu and fade to first level
	var start_y = 350;
	var factor = start_y;
	var max_frames = 60; // length of animation
	
	if current_frame < max_frames {
		current_frame++;
		var move = EaseOutBounce(current_frame, 0, 1, max_frames);
	} else {
		move = 1;
		// allow game start as menu has dropped
		if (keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_face1)) and !instance_exists(obj_fade) {
			fade_to_room(room_next(room), 0, 0, 1, c_black);
		}
	}
	draw_sprite(spr_main_menu, 0, 0, (move * factor) - start_y);
	
	// draw the high score
	if current_frame == max_frames {
		draw_set_halign(fa_right);
		draw_set_font(font_bookman);
		draw_text_ext_color(gw - 10, 28, highscore, 5, 100, c_aqua, c_aqua, c_gray, c_gray, 1);
	}
}

// fade screen in
if fade_in {
	alpha = lerp(alpha, 0, fade_speed);
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, gw, gh, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
	
// display message
if alarm[DISPLAY_MSG] > 0 {
	draw_set_halign(fa_center);
	draw_set_font(font_bookman);
	draw_set_color(c_black);
	draw_text(gw / 2 + 1, gh * 0.85 + 1, msg);
	draw_set_color(c_white);
	draw_text(gw / 2, gh * 0.85, msg);
}