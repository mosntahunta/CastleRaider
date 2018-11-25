///< calculate movement
horizontal_speed += (right - left) * walk_speed;
vertical_speed += global.grav;

// drag
horizontal_speed = lerp(horizontal_speed, 0, drag);

// stop
if( abs(horizontal_speed) <= 0.1 ) horizontal_speed = 0;

// face the correct way
if( horizontal_speed != 0.0 ) facing = sign(horizontal_speed);

// limit the speed
horizontal_speed = min(abs(horizontal_speed), max_horizontal_speed) * facing;