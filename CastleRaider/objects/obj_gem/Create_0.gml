vertical_speed_initial = random_range(-6, -3);
vertical_speed = vertical_speed_initial;

horizontal_speed_initial = random_range(2, 5) * choose(-1, 1); 
horizontal_speed = horizontal_speed_initial;

hsp_decimal = 0;
vsp_decimal = 0;

drag = 0.05;
die = false;

// pick colour
image_index = irandom(image_number - 1);

// has bounce happened yet
bounce = false;

// can player pick up this yet
can_pickup = false;