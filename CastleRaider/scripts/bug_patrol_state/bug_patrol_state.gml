// frog idle state

// check health
check_enemy_hp();

horizontal_speed = spd * facing;
vertical_speed = 0;

// change state
if abs(start_x - x) > patrol_distance {
	state = bug_states.IDLE;
}

// turn around if a wall is found
if facing var side = bbox_right else var side = bbox_left;
var t1 = tilemap_get_at_pixel(global.map, side + sign(horizontal_speed), y);

if t1 == SOLID {
	state = bug_states.IDLE;
}

// chase
if distance_to_object(obj_player) < chase_distance and obj_player.hp > 0 {
	state = bug_states.CHASE;
	audio_play_sound(snd_bug_sees_player, 40, false);
}

// apply movements
collision();

// animation
bug_animation();