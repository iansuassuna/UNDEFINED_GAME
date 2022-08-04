///@description Core Player Logic
script_execute(state);

global.player_life_in_percent = hp/max_hp * 100;

if(recovery_frame > 0) recovery_frame --;
if(start_up_frame > 0) start_up_frame --;

if(keyboard_check_pressed(ord("R"))){
	game_restart();
}