// execute the state
if !instance_exists(obj_fade) {
	script_execute(states_array[state]);
} else {
	if state != states.DIE {
		image_index = 0;
	}
}