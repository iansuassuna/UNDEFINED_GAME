/// @description Variables
//HP
hp = 10;
damage = 0;
//Movement
hsp= 0;
vsp= 0;
grv = 0.3;
walksp = 2.5;
jumpsp = 5;
jumped = false;
can_walljp = true;
onwall = 0;
hsp_max = 6;
friction_delay = 0;
fric = 0;
//Roll
roll_dir = image_xscale;
roll_vel = 4.5;
vsp_rj = -4;
hsp_rj = 6;
grv_roll = 0.35;
//Dash
dash_dir = image_xscale;
dash_vel = 6;
//State
state = scr_player;
//Walk Jump
walljumpdelay = 17;
vsp_wjump = -5;
hsp_wjump = 4;
vsp_max_wall = 4;
grv_wall = 0.25;
//Frames states
recovery_frame= 0;
start_up_frame = 0;
cooldown = 0;
can_dash = true;
punish_time = 0;
punish_time_max = 17;
//Roll
isOver = false;
//Attack
hitByAttack = ds_list_create();

