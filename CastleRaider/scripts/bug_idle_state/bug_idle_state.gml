// frog idle state

// check health
check_enemy_hp();

horizontal_speed = 0;
vertical_speed = 0;

// change state
if wait_time < 0 {
	facing *= -1;
	start_x = x;
	state = bug_states.PATROL;
	wait_time = wait_time_init;
} else {
	wait_time--;
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