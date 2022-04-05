// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Collision_controler(){
//Horizontal
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
}