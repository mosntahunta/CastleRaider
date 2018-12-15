// frog idle state

// check health
check_enemy_hp();

// calculate target movement
if obj_player.hp > 0 {
	target_x = obj_player.xprevious;
	target_y = obj_player.yprevious - sprite_get_height(obj_player.sprite_index) / 2;
} else {
	// return to start position if player has died
	target_x = start_x;
	target_y = start_y;
	// return to idle once at or near start position
	if abs(x - start_x) < 2 and abs(y - start_y) < 2 {
		state = bug_states.IDLE;
	}
}

var dir = point_direction(x, y, target_x, target_y);
var xx = lengthdir_x(chase_spd, dir);
var yy = lengthdir_y(chase_spd, dir);

// if knockback, don't advance
if !hurt and alarm[KNOCKEDBACK] < 0 {
	// move towards the player
	var buffer = 15; // this will stop flicking left and right at player's x
	if (abs(x - obj_player.x) > buffer) or (obj_player.hp <= 0) {
		horizontal_speed = xx;
	}
	vertical_speed = yy;
} else {
	// bug is hurt
	// ensure no vertical movement when knocked back
	// slowdown knockback
	vertical_speed = 0;
	horizontal_speed = lerp(horizontal_speed, 0, drag);
}

// facing direction
if sign(xx) != 0 {
	facing = sign(xx);
}

if !audio_is_playing(snd_bug_chase) audio_play_sound(snd_bug_chase, 30, false);

// apply movements
collision();

// animation
bug_animation();