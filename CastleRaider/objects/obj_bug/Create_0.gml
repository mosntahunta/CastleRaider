event_inherited();

horizontal_speed = 0;
max_hsp_initial = .5;
max_horizontal_speed = max_hsp_initial;

vertical_speed = 0;
spd = .5;
hsp_decimal = 0;
vsp_decimal = 0;

drag = 0.04;
hp = 3;
death_gem_value = 5;

// patrol
// how far the bug moves in one direction
patrol_distance = 96;
// patrol start position
start_x = x;
start_y = y;
// how long to wait before patrolling
wait_time_init = random_range(room_speed * 2, room_speed * 4);
wait_time = wait_time_init;

// chase
target_x = 0;
target_y = 0;
chase_spd = 1;

// minimum distance to start chasing
chase_distance = 100;

// hurt
hurt_time = room_speed / 2;


facing = choose(-1, 1);

// states
enum bug_states
{
	IDLE,
	PATROL,
	CHASE
}

state = bug_states.IDLE;

states_array[bug_states.IDLE] = bug_idle_state;
states_array[bug_states.PATROL] = bug_patrol_state;
states_array[bug_states.CHASE] = bug_chase_state;

sprites_array[bug_states.IDLE] = spr_bug_idle;
sprites_array[bug_states.PATROL] = spr_bug_idle;
sprites_array[bug_states.CHASE] = spr_bug_chase;