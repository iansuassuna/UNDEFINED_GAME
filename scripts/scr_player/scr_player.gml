// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player(){
//Ifs dead
if(place_meeting(x,y+1,obj_spike)){
	global.damage = 1;
	knockback_dir = choose(-1,1);
	state = scr_player_hit;
}

//Inputs
mask_index = herochar_idle_anim_strip4;
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
if(!fall_delay){
	if(punish_time == 0){
		hsp = _move * walksp;
	}
}
vsp += grv;

//Fall
if(fall_delay){
	if(_move == 0){
			hsp = fall_hsp;
		}else{
			hsp = _move * walksp;
			fall_delay = false;
		}
	if(onground){
		fall_delay = false;
	}
}

//Jump
if(onground && key_jump){
	vsp = -jumpsp
}
//Attack
if(onground) attacked = false;

if(key_attack && !attacked && recovery_frame == 0){
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
	if(key_roll && onground && vsp > 0){
		alarm[5] = 16;
		start_up_frame = 4;
		state = scr_player_roll;
	}
}

//Dash
if(onground) can_dash = true;

if(recovery_frame = 0 && can_dash){
	if(key_roll && !onground){
		fall_delay = true;
		fall_hsp = hsp_wjump * image_xscale*0.7;
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
mask_index = herochar_jump_double_anim_strip3;
roll_dir = image_xscale;
hsp = roll_dir * roll_vel;
vsp += grv/2;
jumped = false;
key_jump = keyboard_check_pressed(vk_space);

	if(start_up_frame = 0){
		sprite_index = herochar_jump_double_anim_strip3;
		Collision_controler();
		cooldown = 1;
		fall_delay = true;
			if(key_jump){
				mask_index = herochar_idle_anim_strip4;
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
		
			var _inst = instance_create_layer(x,y,"Entitys",obj_dash);
	
		    _inst.sprite_index = sprite_index;
			_inst.image_xscale = image_xscale;
		}
}
function scr_player_roll_jump(){
	//Inputs
	alarm[5] = false;
	alarm[1] = 16;
	mask_index = herochar_jump_double_anim_strip3;
	key_attack = keyboard_check_pressed(ord("J"));
	friction_delay --;
	onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);
	onground = place_meeting(x,y+1,obj_wall);
	hsp = clamp(hsp,-hsp_rj,hsp_rj);
	//Logic
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
	
	if(key_attack){
		state = scr_player_attack;
	}
	
	//Back to Free State
	if(onwall != 0 && friction_delay <= 0 or onground && friction_delay <= 0){
		friction_delay = 0;
		state = scr_player;
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
	fall_hsp = hsp_wjump * image_xscale * 0.6;

	Collision_controler();

	if(!onground && key_jump && onwall != 0){
		vsp = vsp_wjump;
		hsp = -onwall * hsp_wjump;
	}
	if(vsp >= 0){
		fall_delay = true;
		state = scr_player;
	}

}
#region Later	
function scr_player_dead(){
if(sprite_index != herochar_death_anim_strip8){
	sprite_index = herochar_death_anim_strip8;
	image_index = 0;
}

if(Animation_end()){
	y = 688; x = 16;
	global.damage = 0;
	hp = max_hp;
	state = scr_player;
}

}
function scr_player_attack(){
hsp = walksp * image_xscale;
vsp = 0;

Collision_controler();

//Start of the Attack
if(sprite_index != herochar_sword_attack_anim_strip4){
	sprite_index = herochar_sword_attack_anim_strip4;
	image_index = 0;
	ds_list_clear(hitByAttack);
}

//Attack Hitbox and Hits
mask_index = herochar_attack_hitbox_anim_strip4;
var hitByAttackNow = ds_list_create();
var hits = instance_place_list(x,y,obj_enemy,hitByAttackNow,false);
if(hits > 0){
	for (var enemyHits = 0; enemyHits < hits; enemyHits++){
		//If the entity has not yet been hit
		var hitID = ds_list_find_value(hitByAttackNow,enemyHits);
		if(ds_list_find_index(hitByAttack,hitID) == -1){
				ds_list_add(hitByAttack,hitID)
				with (hitID){
					knockback_dir = obj_player.image_xscale;
					hit = true;
				}
			}
	}
}
ds_list_destroy(hitByAttackNow);
mask_index = herochar_idle_anim_strip4;

if(Animation_end()){
	attacked = true;
	recovery_frame = 30;
		if(!onground){
			fall_delay = true;
			fall_hsp = walksp * image_xscale;
		}
	state = scr_player;	
}

}
function scr_player_hit(){
	if(sprite_index != herochar_hit_anim_strip3){
		sprite_index = herochar_hit_anim_strip3; 
		image_index = 0;
	}
	
	while(knockback == false){
		dir = knockback_dir;
		hsp = knockback_hsp * dir;
		vsp = -knockback_vsp;
		knockback = true;
	}
	
	vsp += grv;
	
	Collision_controler();
	
	if(Animation_end(herochar_hit_anim_strip3)){
		hsp = 0;
		knockback = false;
		event_perform(ev_other,ev_user0);
	}else{
		sprite_index = herochar_hit_anim_strip3;
	}

}

#endregion
