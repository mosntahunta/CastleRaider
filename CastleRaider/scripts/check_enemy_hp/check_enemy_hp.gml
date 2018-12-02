if (hp <= 0) {
	show_debug_message("die");
	repeat(death_gem_value) {
		instance_create_layer(x, bbox_top, "Gems", obj_gem);
	}
	instance_destroy();
}