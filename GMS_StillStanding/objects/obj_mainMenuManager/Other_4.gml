/// @description Insert description here
// You can write your code in this editor
if(room==room_mainMenu){
	global.inputReceiver=InputReceiver.MAIN_MENU;
	
	draw_set_font(global.font_CN_mainMenu);
	draw_set_color(c_black);
	
	teamRoomState=TeamRoomState.SELECTING_TEAM;
	targetOptionIndex=0;
}