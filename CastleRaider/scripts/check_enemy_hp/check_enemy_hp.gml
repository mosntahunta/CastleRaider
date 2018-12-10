if (hp <= 0) {
	// hp drop
	var _chance = random(1);
	
	if _chance <= hp_drop_chance {
		instance_create_layer(x, bbox_top, "Gems", obj_hp);
	}
	
	repeat(death_gem_value) {
		instance_create_layer(x, bbox_top, "Gems", obj_gem);
		// generate particles here
		repeat(obj_game.enemy_sparks) {
			var inst = instance_create_depth(x, (bbox_bottom + bbox_top) / 2, depth - 1, obj_spark);
			switch(object_index) {
				case obj_frog:
					if (choose(0, 1, 1)) {
						// gray
						inst.head_colour = c_gray;
						inst.tail_colour = c_dkgray;
					} else {
						// white
						inst.head_colour = c_white;
						inst.tail_colour = c_ltgray;
					}
				break;
				case obj_bug:
					if (choose(0, 1, 1)) {
						// red
						inst.head_colour = c_red;
						inst.tail_colour = c_maroon;
					} else {
						// green
						inst.head_colour = c_lime;
						inst.tail_colour = c_green;
					}
				break;
			}
		}
	}
	
	// score 
	switch(object_index) {
		case obj_frog:
			score += 50;
		break;
		case obj_bug:
			score += 100;
		break;
	}
	
	scr_screen_shake(.15, -1);
	
	instance_destroy();
}