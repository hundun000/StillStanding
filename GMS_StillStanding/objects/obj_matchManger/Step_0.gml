/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.MATCH_MANAGER)	return;

switch(matchRoomState){
	

		
	case MatchRoomState.SELECTING_MATCH_OPERATION:
		if(isA){
			switch(selectedMatchOperationIndex){
				case INDEX_MATCH_ADD_TEAM:
					matchRoomState=MatchRoomState.SELECTING_TEAM;	
					selectedTeamIndex=0;
					break;
				case INDEX_MATCH_CLEAR:
					ds_list_clear(ins_match.teams);
					break;
				case INDEX_MATCH_START_SINGLE:
					ins_match.matchType=MatchType.SINGLE_MATCH;
					ins_match.timeLimit=-1;
					ins_match.blockLimit=SINGLE_MATCH_BLOCK_LIMIT;
					room_goto(room_play);
					break;
				case INDEX_MATCH_START_MULTI:
					ins_match.matchType=MatchType.POLLING_MATCH;
					ins_match.timeLimit=POLLING_MATCH_TIME_LIMIT;
					ins_match.blockLimit=-1;
					room_goto(room_play);
					break;			
			}
		}
		else if(isB){
			instance_destroy(ins_match);
			room_goto(room_mainMenu);		
			return;

		}
		else if(input_dy!=0){
			selectedMatchOperationIndex=clamp(selectedMatchOperationIndex+input_dy,0,array_length_1d(MATCH_OPERATION_TEXTS)-1);
		}
		break;
	case MatchRoomState.SELECTING_TEAM:
		if(isA){
			if(selectedTeamIndex!=-1){
				var ins_team=ds_list_find_value(global.thisGame.teamManager.teams,selectedTeamIndex);
				
				var isNotInMatch=(ds_list_find_index(ins_match.teams,ins_team)==-1);
				if(isNotInMatch){
					ds_list_add(ins_match.teams,ins_team);	
					ds_list_add(ins_match.usedTime,0);	
					ds_list_add(ins_match.numCorrectAnswer,0);	
					ds_list_add(ins_match.numWrongAnswer,0);	
					selectedTeamIndex=-1;
					matchRoomState=MatchRoomState.SELECTING_MATCH_OPERATION;
				}	
			}
		}
		else if(isB){	
			matchRoomState=MatchRoomState.SELECTING_MATCH_OPERATION;		
			selectedTeamIndex=-1;		
		}
		else if(input_dy!=0){
			selectedTeamIndex=clamp(selectedTeamIndex+input_dy,0,ds_list_size(global.thisGame.teamManager.teams)-1);
		}
		break;	
		
}