///
/// tiles
///

// get tile map
global.map = layer_tilemap_get_id("Collisions");
global.tile_size = 32;

// create player
if room != rm_init and room != rm_menu and room!= rm_game_end and !instance_exists(obj_player) {
	instance_create_layer(x, y, "Player", obj_player);
}

// cancel any messages
alarm[DISPLAY_MSG] = 0;