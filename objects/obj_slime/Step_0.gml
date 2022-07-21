#region Hit and Life Logic
if(hit){
	sprite_index = slime_hit_anim_strip3;
	if(Animation_end(slime_hit_anim_strip3)){
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


if(instance_exists(obj_player)){
	if(region <= range && alarm[0] = -1 && onground){
		dir = point_direction(x,y,obj_player.x,y);
		alarm[0] = room_speed/4;	
		show_debug_message(dir);
	}
	if(region > range && alarm[0] = -1 && onground){
		dir = choose(0,180);
		alarm[0] = room_speed/2;
		show_debug_message(dir);
	}
}

Collision_controler();

#endregion