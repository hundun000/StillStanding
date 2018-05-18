/// @description Insert description here
// You can write your code in this editor
var isA_game=keyboard_check_pressed(BTN_A);
var isB_game=keyboard_check_pressed(BTN_B);
var dx_game=keyboard_check_pressed(BTN_R)-keyboard_check_pressed(BTN_L);
var dy_game=keyboard_check_pressed(BTN_D)-keyboard_check_pressed(BTN_U);

var reciever;
switch(global.inputReceiver){
	
	case InputReceiver.MAIN_MENU:
		reciever=mainMenuManager;
		break;	
	case InputReceiver.TEAM_MANAGER:
		reciever=teamManager;
		break;
	case InputReceiver.PLAY_MANAGER:
		reciever=playManager;
		break;
	case InputReceiver.MATCH_MANAGER:
		reciever=matchManager;
		break;	
	case InputReceiver.RULE_MANAGER:
		reciever=ruleManager;
		break;	
	case InputReceiver.GROUP_MANAGER:
		reciever=global.groupManager;
		break;		
}

//set reciever
if(reciever!=noone){
	reciever.isA=isA_game;
	reciever.isB=isB_game;
	reciever.input_dx=dx_game;
	reciever.input_dy=dy_game;
}