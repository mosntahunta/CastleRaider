var _msg = "find the chest to open the door";

if other.stage != 999 {
	// get layer id
	var layer_id = layer_get_id("Stage" + string(other.stage));

	instance_activate_layer(layer_id);

	// destroy trigger
	instance_destroy(other);
	
	if other.stage == 5 and !obj_chest.open {
		var layer_id = layer_get_id("Door");
		layer_set_visible(layer_id, false);
		
		// give the player a message
		show_msg(_msg, 4);
	}
} else {
	// game end
	if obj_chest.open {
		obj_game.game_over_won = true;
		fade_to_room(rm_game_end, 0, 0, 1, c_black);
		state = states.GAME_END;
		instance_destroy(other);
	} else {
		// give the player a message
		show_msg(_msg, 4);
	}
}
	