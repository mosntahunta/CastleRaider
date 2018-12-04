if (hp <= 0) {
	show_debug_message("die");
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
			}
		}
	}
	instance_destroy();
}