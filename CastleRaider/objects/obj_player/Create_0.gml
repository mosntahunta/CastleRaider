///< speeds
horizontal_speed = 0;
vertical_speed = 0;
max_horizontal_speed = 2;
walk_speed = 1.5;
jump_speed = -5;
jump_dampner = 3.5;
number_of_jumps_init = 2;
number_of_jumps = number_of_jumps_init;

hsp_decimal = 0;
vsp_decimal = 0;

///< friction
drag = .12;

///< facing direction
facing = 1; // 1 is right, -1 is left

gems = 0;

// hurt
flash_counter = 0;
hurt = false;
hurt_time = room_speed;
hp = 5;
max_hp = hp;

// movement
left  = 0;
right = 0;
up	  = 0;
down  = 0;
attack = 0;
jump = 0;
jump_held = 0;
block = 0;

// camera
obj_camera.follow = obj_player;

// states
enum states
{
	IDLE,
	WALK,
	JUMP,
	ATTACK,
	BLOCK,
	CROUCH,
	CROUCH_BLOCK,
	HURTING,
	KNOCKBACK
}

state = states.IDLE;

// states array 
// [enum, script] mapping
states_array[states.IDLE]			= player_idle_state;
states_array[states.WALK]			= player_walk_state;
states_array[states.JUMP]			= player_jump_state;
states_array[states.ATTACK]			= player_attack_state;
states_array[states.BLOCK]			= player_block_state;
states_array[states.CROUCH]			= player_crouch_state;
states_array[states.CROUCH_BLOCK]	= player_crouch_block_state;
states_array[states.HURTING]		= player_hurting_state;
states_array[states.KNOCKBACK]		= player_knockback_state;

// sprites array 
// [enum, sprites] mapping
sprites_array[states.IDLE]			= spr_player_idle;
sprites_array[states.WALK]			= spr_player_walk;
sprites_array[states.JUMP]			= spr_player_jump;
sprites_array[states.ATTACK]		= spr_player_attack;
sprites_array[states.BLOCK]			= spr_player_block;
sprites_array[states.CROUCH]		= spr_player_crouch;
sprites_array[states.CROUCH_BLOCK]	= spr_player_crouch_block;
sprites_array[states.HURTING]		= spr_player_hurting;
sprites_array[states.KNOCKBACK]		= spr_player_knockback;

// mask array 
// [enum, sprites] mapping
mask_array[states.IDLE]			= spr_player_idle;
mask_array[states.WALK]			= spr_player_walk;
mask_array[states.JUMP]			= spr_player_jump;
mask_array[states.ATTACK]		= spr_player_attack;
mask_array[states.BLOCK]		= spr_player_block;
mask_array[states.CROUCH]		= spr_player_crouch;
mask_array[states.CROUCH_BLOCK]	= spr_player_crouch;
mask_array[states.HURTING]		= spr_player_idle;
mask_array[states.KNOCKBACK]	= spr_player_knockback;
