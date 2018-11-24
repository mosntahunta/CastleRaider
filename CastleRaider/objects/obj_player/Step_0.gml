///< get input
var left  = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up	  = keyboard_check(vk_up);
var down  = keyboard_check(vk_down);

///< calculate movement
horizontal_speed += (right - left) * walk_speed;

// drag
horizontal_speed = lerp(horizontal_speed, 0, drag);

// stop
if( abs(horizontal_speed) <= 0.1 ) horizontal_speed = 0;

// face the correct way
if( horizontal_speed != 0.0 ) facing = sign(horizontal_speed);

// limit the speed
horizontal_speed = min(abs(horizontal_speed), max_horizontal_speed) * facing;

// apply movement
x += horizontal_speed;
y += vertical_speed;

// apply animation
if( horizontal_speed != 0 )
{
	image_xscale = facing;
	sprite_index = spr_player_walk;
}
else
{
	sprite_index = spr_player_idle;
}