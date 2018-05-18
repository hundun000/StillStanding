/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.MAIN_MENU) return;

if(input_dy!=0){
		targetOptionIndex=(numOption+targetOptionIndex+input_dy)%numOption;
}

if(isA){
	switch(targetOptionIndex){
		case 0:
			room_goto(room_match);
			break;
		case 1:
			break;
		case 2:	
			room_goto(room_rule);
			break;
		case 3:
			room_goto(room_team);
			break;	
		case 4:
			room_goto(room_group);
			break;		
		case 5:
			game_end();
			break;

	}
}