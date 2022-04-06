// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player(){
//Ifs dead
if(place_meeting(x,y+1,obj_spike)){
	global.damage = 100000;
	alarm[4] = 16;
	event_perform(ev_other,ev_user0);
}

//Inputs

onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);
onground = place_meeting(x,y+1,obj_wall);
punish_time = max(punish_time-1,0);
key_attack = keyboard_check_pressed(ord("J"));
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_roll = keyboard_check_pressed(vk_shift);

//Movement
var _move = key_right - key_left;
clamp(hsp,-hsp_max,hsp_max);
if(friction_delay == 0){
	if(punish_time == 0){
		hsp = _move * walksp;
	}
}
vsp += grv;

//Friction
if(friction_delay > 0){
	if(_move == 0){
			hsp = hsp_wjump * image_xscale * 0.6;
		}else{
			hsp = _move * walksp;
			friction_delay = 0;
		}
	if(onground) friction_delay = 0;
}

//Jump
if(onground && key_jump){
	vsp = -jumpsp
}

//Attack
if(key_attack){
	alarm[0] = 12;
	state = scr_player_attack;
}

//Wall Jump
if(!onground && key_jump && onwall != 0){
	vsp = vsp_wjump;
	hsp = -onwall * hsp_wjump;
	state = scr_player_wall_jump;
}

//Roll
if(cooldown != 1 && recovery_frame = 0){
	if(key_roll && onground && vsp> 0){
		alarm[5] = 16;
		start_up_frame = 4;
		state = scr_player_roll;
	}
}

//Dash
if(onground) can_dash = true;

if(recovery_frame = 0 && can_dash){
	if(key_roll && !onground){
		friction_delay = 15;
		alarm[0] = 16;
		start_up_frame = 4;
		state = scr_player_dash;
	}
}

#region Colission and Animation Controller

if(hsp != 0) image_xscale = sign(hsp)
if(place_meeting(x+hsp,y,obj_wall)){
	while (!place_meeting(x+sign(hsp),y,obj_wall)){
		x+= sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical
if(place_meeting(x,y+vsp,obj_wall)){
	while (!place_meeting(x,y+sign(vsp),obj_wall)){
		y+= sign(vsp);
	}
	vsp =0;
}
y += vsp;
//Animation Controler
if(!place_meeting(x,y+1,obj_wall)){
if(onwall != 0)image_xscale = onwall;
if(vsp > 0){ sprite_index = herochar_jump_down_anim_strip3 ; }else sprite_index = herochar_jump_up_anim_strip3;
}else{
image_speed = 1;
if(hsp == 0){
		sprite_index = herochar_idle_anim_strip4;
	}else{
		sprite_index = herochar_run_anim_strip6;
		
}
}
#endregion
}

function scr_player_roll(){
roll_dir = image_xscale;
hsp = roll_dir * roll_vel;
jumped = false;
key_jump = keyboard_check_pressed(vk_space);

	if(start_up_frame = 0){
		sprite_index = herochar_jump_double_anim_strip3;
		Collision_controler();
		cooldown = 1;
			if(key_jump){
				friction_delay = 2;
				state = scr_player_roll_jump;
			}
		}
}
function scr_player_dash(){
dash_dir = image_xscale;
hsp = dash_dir * dash_vel;
vsp = 0;
fric = 4;
can_dash = false;
	if(start_up_frame = 0){
		sprite_index = herochar_jump_up_anim_strip3;
		Collision_controler();
		
		var _inst = instance_create_layer(x,y,"Instances",obj_dash);
	
	    _inst.sprite_index = sprite_index;
		_inst.image_xscale = image_xscale;
	}
}
function scr_player_roll_jump(){
	alarm[5] = false;
	alarm[1] = 16;
	friction_delay --;
	onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);
	onground = place_meeting(x,y+1,obj_wall);
	hsp = clamp(hsp,-hsp_rj,hsp_rj);
	if(friction_delay <= 0){
		vsp = clamp(vsp,vsp_rj,-vsp_rj);
		vsp += grv_roll;
	}else{
		vsp = vsp_rj;
	}
	cooldown = 1;
	jumped = false;
	recovery_frame= 14;
	
	Collision_controler();
	
	
	
	if(onwall != 0 && friction_delay <= 0 or onground && friction_delay <= 0){
		state = scr_player;
		friction_delay = 0;
	}
	
}
function scr_player_wall_jump(){
//Inputs
	onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);
	key_jump = keyboard_check_pressed(vk_space);
	onground = place_meeting(x,y+1,obj_wall);
//Wall Jump Logic
	hsp = clamp(hsp,-hsp_max,hsp_max);
	vsp = clamp(vsp,-vsp_max_wall,vsp_max_wall);
	vsp += grv_wall;
	

	Collision_controler();

	if(!onground && key_jump && onwall != 0){
		vsp = vsp_wjump;
		hsp = -onwall * hsp_wjump;
	}
	if(vsp >= 0){
		friction_delay = 1;
		state = scr_player;
	}

}
#region Later	
function scr_player_dead(){
sprite_index = herochar_death_anim_strip8;
}
function scr_player_attack(){
hsp = 0;
vsp = 0;

//Start of the Attack
if(sprite_index != herochar_sword_attack_anim_strip4){
	sprite_index = herochar_sword_attack_anim_strip4;
	image_index = 0;
	ds_list_clear(hitByAttack);
}



}
function scr_player_attack_combo(){}
#endregion
