hsp = 0;
max_hsp_initial = 2;
max_hsp = max_hsp_initial;

vsp = 0;
spd = 2;
jump_spd = -6;
hsp_decimal = 0;
vsp_decimal = 0;

facing = choose(-1, 1);

// states
enum frog_states
{
	IDLE
}

state = frog_states.IDLE;

states_array[frog_states.IDLE] = frog_idle_state;

sprites_array[frog_states.IDLE] = spr_frog_idle;