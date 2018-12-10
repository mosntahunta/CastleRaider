/// @description Insert description here
// You can write your code in this editor

if mouse_check_button_pressed(mb_left) {
	repeat(3) {
		instance_create_layer(mouse_x, mouse_y, "Gems", obj_gem);
	}
}

if mouse_check_button_pressed(mb_right) {
	obj_player.hp = 0;
}

if game_over_lose {
	with(obj_player) {
		get_input();
		if jump or attack {
			game_restart();
		}
	}
}