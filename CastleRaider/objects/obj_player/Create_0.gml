///< speeds
horizontal_speed = 0;
vertical_speed = 0;
max_horizontal_speed = 2;
walk_speed = 1.5;

///< friction
drag = .12;

///< facing direction
facing = 1; // 1 is right, -1 is left

// movement
left  = 0;
right = 0;
up	  = 0;
down  = 0;

// states
enum states
{
	IDLE,
	WALK
}

state = states.IDLE;