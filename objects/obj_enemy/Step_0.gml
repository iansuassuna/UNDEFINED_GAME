//Life Check
life_in_percent = life/max_life * 100;

//Hit
if(hit){
	
	sprite_index = hit_sprite;
	
	if(!invulnerable){ 
		life -= 5;
		image_index = 0;
		invulnerable = true;
	}
	
	while(knockback == false){
		dir = point_direction(obj_player.x,y,x,y);
		hsp = lengthdir_x(knockback_hsp,dir);
		vsp = -knockback_vsp;
		knockback = true;
	}
	
	
	if(Animation_end(hit_sprite)){
		hsp = 0;
		knockback = false;
		invulnerable = false;
		hit = false;
		sprite_index = idle_sprite;
	}else{
		sprite_index = hit_sprite;
	}

}

// Dead
if(life <= 0){
	instance_destroy(self);
}
