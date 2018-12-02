// cycle through all the players and see if they were hit
with (instance_place(x, y, obj_player)) {
	process_enemy_attack(5, 2.5);
}

// enable death at beginstep
die = true;