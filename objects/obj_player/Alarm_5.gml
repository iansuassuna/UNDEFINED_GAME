recovery_frame= 14;
alarm[1] = 16;
jumped = false;
state = scr_player;
if(place_meeting(x,y-1,obj_wall)){
		alarm[5] = 16;
		start_up_frame = 4;
		state = scr_player_roll;
}
