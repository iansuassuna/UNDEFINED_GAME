//Follow the target
if(instance_exists(target)){
global.cameraX = target.x - cameraW2;
global.cameraY = target.y - cameraH2;
global.cameraX = clamp(global.cameraX,0,room_width - global.camera_W);
global.cameraY = clamp(global.cameraY,0,room_width - global.camera_H);
}

camera_set_view_pos(view_camera[0],global.cameraX, global.cameraY);


//if(target.y > 710){ target.y = 688; target.x = 16;}

