global.cameraX = 0;
global.cameraY = 0;
target = obj_player;

global.camera_W = 680;
global.camera_H = 384;
cameraW2 = global.camera_W / 2;
cameraH2 = global.camera_H / 2;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], global.camera_W, global.camera_H);

if(instance_exists(target)){
global.cameraX = target.x - cameraW2;
global.cameraY = target.y - cameraH2;
global.cameraX = clamp(global.cameraX,0,room_width - global.camera_W);
global.cameraY = clamp(global.cameraY,0,room_height - global.camera_H);
}
camera_set_view_pos(view_camera[0],global.cameraX, global.cameraY);

displayScale = 2;
displayWidth = global.camera_W * displayScale;
displayHeight = global.camera_H * displayScale;

window_set_size(displayWidth, displayHeight);
surface_resize(application_surface,displayWidth,displayHeight);

//GUI
display_set_gui_size(global.camera_W,global.camera_H);
alarm[0] = 1;
