// calculate movement for entities

vertical_speed += global.grav;

// drag
horizontal_speed = lerp(horizontal_speed, 0, drag);

// stop
if( abs(horizontal_speed) <= 0.1 ) horizontal_speed = 0;