event_inherited();
//Sprites
hit_sprite = goblin_hit_anim_strip3;
idle_sprite = goblin_idle_anim_strip4;
//Movement
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 1;
dir = 0;
region = 100;
attack = false;
hitByAttack = ds_list_create();
player_hit = false;