// 720 x 360

// gems
draw_set_font(font_stats);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var colour = make_color_rgb(173, 144, 159);
draw_set_color(colour);

// set draw location
var xx = display_get_gui_width() - 92;
var yy = 2;

draw_sprite(spr_gem_gui, 0, xx, yy);

// text
var text_xx = 7;
var text_yy = 22;
draw_set_color(c_black);
draw_text(xx + text_xx + 1, yy + text_yy + 1, obj_player.gems );
draw_set_color(colour);
draw_text(xx + text_xx, yy + text_yy, obj_player.gems );

// hp bar
xx = 48;
yy = 25;

// draw red bar
draw_sprite(spr_hp_bar, 1, xx, yy);
draw_sprite_ext(spr_hp_bar, 2, xx, yy, obj_player.hp / obj_player.max_hp, 1, 0, c_white, image_alpha);
draw_sprite(spr_hp_bar, 0, xx, yy);

// lives
xx = 48;
yy = 32;
var gap = 22;
if lives > 0 {
	// draw number of lives
	for (var i = 0; i < lives; i++) {
		draw_sprite(spr_lives, 0, xx + i * gap, yy);
	}
}