// frog idle state

// get inputs

// calculate movements
horizontal_speed += spd * facing;
vertical_speed += global.grav;

// limit speed
horizontal_speed = min(abs(horizontal_speed), max_horizontal_speed) * facing;

// modify state

// apply movements
collision();

// animation
frog_animation();