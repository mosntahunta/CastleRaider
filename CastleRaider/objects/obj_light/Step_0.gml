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
			flickering = false;
		break;
		case 2:
		// chest
			intensity = .25;
			radius = 40;
			colour = c_red;
			flickering = false;
		break;
		case 3:
		// water
			intensity = .3;
			radius = 20;
			colour = c_aqua;
		break;
		case 4:
		// gems
			intensity = .2;
			radius = 15;
			flickering = false;
			switch(colour_index) {
				case 0: colour = c_lime; break;
				case 1: colour = c_yellow; break;
				case 2: colour = c_aqua; break;
				case 3: colour = c_purple; break;
				case 4: colour = c_red; break;
			}
		break;	
		case 5:
		// hp
			intensity = .3;
			radius = 18;
			colour = c_white;
			flickering = false;
		break;
	}
}