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
	// give the player a message
	show_msg(_msg, 4);
}
	