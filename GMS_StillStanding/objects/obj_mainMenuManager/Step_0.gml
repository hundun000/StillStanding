/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.MAIN_MENU) return;

if(input_dy!=0){
		targetOptionIndex=(numOption+targetOptionIndex+input_dy)%numOption;
}

if(isA){
	switch(targetOptionIndex){
		case INDEX_MAIN_PLAY:
			room_goto(room_match);
			break;
		case INDEX_MAIN_TEAM:
			room_goto(room_team);
			break;
		case INDEX_MAIN_RULE:	
			room_goto(room_rule);
			break;
		case INDEX_MAIN_GROUP:
			room_goto(room_group);
			break;		
		case INDEX_MAIN_EXIT:
			game_end();
			break;

	}
}