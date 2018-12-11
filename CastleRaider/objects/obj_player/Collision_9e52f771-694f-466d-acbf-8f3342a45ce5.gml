with(other) {
	if !active {
		fade_to_room(target_room, target_x, target_y, other.facing, c_black);
		active = true;
	}
}