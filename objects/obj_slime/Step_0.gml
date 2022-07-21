#region Hit and Life Logic

life_in_percent = life/max_life * 100;

if(hit){
	if(!invulnerable) life -= 5;
	sprite_index = slime_hit_anim_strip3;
	invulnerable = true;
	
	while(knockback == false){
		show_debug_message("knockback");
		alarm[0] = false;
		dir = point_direction(obj_player.x,y,x,y);
		hsp = lengthdir_x(walksp,dir);
		vsp = -jumpsp/2;
		knockback = true;
	}
	
	if(Animation_end(slime_hit_anim_strip3)){
		knockback = false;
		invulnerable = false;
		hit = false;
	}
}else{
	sprite_index = slime_idle_anim_strip5;
}

if(life <= 0){
	instance_destroy(self);
}

#endregion

#region Movement Logic
region = point_distance(x,y,obj_player.x,y);
onground = place_meeting(x,y+1,obj_wall);
vsp += grv;

if(!onground){
	hsp = lengthdir_x(walksp,dir);
}else{
	hsp = 0;
}


if(instance_exists(obj_player) && hit == false){
	if(region <= range && alarm[0] = -1 && onground){
		dir = point_direction(x,y,obj_player.x,y);
		alarm[0] = room_speed/4;	
	}
	if(region > range && alarm[0] = -1 && onground){
		dir = choose(0,180);
		alarm[0] = room_speed/2;
	}
}

Collision_controler();

#endregion