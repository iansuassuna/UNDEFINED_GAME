///@description Core Player Logic
script_execute(state);
if(recovery_frame != 0){ recovery_frame --;} //walksp = walksp / 4;}else walksp = 3
if(start_up_frame != 0)start_up_frame --;
if(keyboard_check_pressed(ord("R"))){
	game_restart();
}
////Inputs
//key_left = keyboard_check(vk_left);
//key_right = keyboard_check(vk_right);
//key_jump = keyboard_check_pressed(ord("C"));
//key_roll = keyboard_check_pressed(vk_shift);

////Movement
//var _move = key_right - key_left;

//hsp = _move * walksp;

//rhsp = 2 * walksp * image_xscale;

//vsp += grv;



//if(place_meeting(x,y+1,obj_wall) && key_jump){
//	vsp = -jumpsp
//}
//if(key_roll){
//if(place_meeting(x+rhsp,y,obj_wall)){
//	while (!place_meeting(x+sign(rhsp),y,obj_wall)){
//		x+= sign(rhsp);
//	}
//	rhsp = 0;
//}
 
// x+= rhsp;
//}


//if(hsp != 0) image_xscale = sign(hsp)
//if(place_meeting(x+hsp,y,obj_wall)){
//	while (!place_meeting(x+sign(hsp),y,obj_wall)){
//		x+= sign(hsp);
//	}
//	hsp = 0;
//}
//x += hsp;
////Vertical
//if(place_meeting(x,y+vsp,obj_wall)){
//	while (!place_meeting(x,y+sign(vsp),obj_wall)){
//		y+= sign(vsp);
//	}
//	vsp =0;
//}
//y += vsp;
//if(!place_meeting(x,y+1,obj_wall)){
	
//	if(vsp > 0) sprite_index = herochar_jump_down_anim_strip3 ; else sprite_index = herochar_jump_up_anim_strip3;
//}else{
//image_speed = 1;
//if(!key_roll){
//if(hsp == 0){
//		sprite_index = herochar_idle_anim_strip4;
//	}else{
//		sprite_index = herochar_run_anim_strip6;

//}
//}
//if(key_roll)sprite_index = herochar_jump_double_anim_strip3;

//}