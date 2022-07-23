// Inherit the parent event
//Hit and Knockback
event_inherited();

onground = place_meeting(x,y+1,obj_wall);
vsp += grv;
range = point_distance(x,y,obj_player.x,y);
dir = point_direction(x,y,obj_player.x,y);

if(range <= region && !hit && onground){
	hsp = lengthdir_x(walksp,dir);
	if(instance_place(x+sign(hsp),y,obj_player)){
		if(obj_player.state = scr_player){
			attack = true;
			show_debug_message("BABYUM");
		}
	}
}else{
	hsp = 0;
}


if(attack){
	hsp = 0;
	if(sprite_index != goblin_attack_anim_strip4){
		sprite_index = goblin_attack_anim_strip4;
		image_index = 0;
	}
	
	//Attack
	mask_index = goblin_attack_hitbox_anim_strip4;
	if(!player_hit){
		if(instance_place(x,y,obj_player)){
			with(obj_player){
				global.damage = 2;
				state = scr_player_hit;
			}
		}
	}
	
	if(Animation_end()){
		player_hit = false;
		mask_index = goblin_idle_anim_strip4;
		sprite_index = goblin_idle_anim_strip4;
		attack = false;
	}
	
}


if(!attack) Collision_controler();