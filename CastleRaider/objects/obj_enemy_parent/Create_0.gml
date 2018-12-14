hurt = false;
hurt_time = room_speed * 1.5;
hp = 2;

flash_counter = 0;

drag = 0.12;

// how many gems to drop on death
death_gem_value = 3;

// hp
hp_drop_chance = 0.3;

// puff of smoke as spawn
if room == rm_02 {
	alarm[SPAWN] = 1;
}