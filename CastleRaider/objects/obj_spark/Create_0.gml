line_width = 2;
direction = random(360);
speed = random_range(2, 15);

// how fast the particle changes direction
direction_change = random_range(-20, 20);
dir_change_decay = 0.93;
// how fast the particle will slow down
speed_decay = random_range(0.87, 0.98);

// colour
head_colour = 0;
tail_colour = 0;

// x-y previous
xp = x;
yp = y;

xpp = xprevious;
ypp = yprevious;