draw_healthbar(health_bar_x1,health_bar_y1,health_bar_x2,health_bar_y2,global.player_life_in_percent,c_black,c_red,c_green,0,true,true);
draw_sprite(health_hud_left,0,health_bar_x1,11);
draw_sprite(health_hud_middle,0,health_bar_x1+16,11);
draw_sprite(health_hud_right,0,health_bar_x1+32,11);