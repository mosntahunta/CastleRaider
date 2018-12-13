macros();

global.grav = 0.25;

// set gui size
display_set_gui_size(720, 360);

// how many sparks come off gems
gem_sparks = 6;

// how many sparks come off enemy death
enemy_sparks = 4;

// game over
// game over and we lost
game_over_lose = false;

// game over and we won
game_over_won = false;

// main menu
current_frame = 0;

// fade in the menu
fade_in = true;
alpha = 1;
fade_speed = 0.02;

// highscore
save_name = "game.sav";
highscore = 0;

// open savefile
ini_open(save_name);
// read an old high score or set it to 0 if none
highscore = ini_read_real("Score", "Highscore", 0);
ini_close();