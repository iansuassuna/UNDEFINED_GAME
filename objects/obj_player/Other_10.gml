hp -= global.damage;
if(hp <= 0){
	state = scr_player_dead;
}else{
	state = scr_player;
}