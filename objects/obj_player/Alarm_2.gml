punish_time = punish_time_max;
hsp = hsp_rj * image_xscale;
vsp = vsp_rj;
if(place_meeting(x,y+vsp,obj_wall)){
	while (!place_meeting(x,y+sign(vsp),obj_wall)){
		y+= sign(vsp);
}
	vsp =0;
}
y += vsp;
cooldown = 1;
jumped = false;