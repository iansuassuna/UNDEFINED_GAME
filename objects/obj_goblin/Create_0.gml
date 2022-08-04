event_inherited();
//Sprites
hit_sprite = goblin_hit_anim_strip3;
idle_sprite = goblin_idle_anim_strip4;
//Movement
randomize();
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = choose(0.5,0.8,1);
show_debug_message(walksp);
dir = 0;
region = random_range(50,100);
attack = false;
hitByAttack = ds_list_create();
player_hit = false;