if (colour == c_black) {
	// only run once
	switch(type) {
		case 0:
		// wall torch
			intensity = .4;
			radius = 34;
			colour = make_color_rgb(220, 134, 59);
		break;
		case 1:
		// window
			intensity = .2;
			radius = 27;
			colour = make_color_rgb(220, 134, 59);
		break;
		case 2:
		// chest
			intensity = .25;
			radius = 40;
			colour = c_red;
		break;
		case 3:
		// water
			intensity = .3;
			radius = 20;
			colour = c_aqua;
		break;
	}
}