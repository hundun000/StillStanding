/// @description Insert description here
// You can write your code in this editor
enum LogType{
	ERR_LOG,
	PLAY_LOG,
	IO_LOG
	
}

#macro DEPTH_LOG_BOARD -10
event_inherited();

global.logManager=id;
font=font_add("ARIALUNI_fixed.ttf",10,0,0,32,128);

x-=sprite_width/2;
y-=sprite_height/2;

