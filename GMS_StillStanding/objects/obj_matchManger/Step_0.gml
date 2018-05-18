/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.MATCH_MANAGER)	return;

switch(matchRoomState){
	

		
	case MatchRoomState.SELECTING_MATCH_OPERATION:
		if(isA){
			switch(selectedOperationIndex){
				case INDEX_MATCH_ADD_TEAM:
					matchRoomState=MatchRoomState.SELECTING_TEAM;	
					selectedTeamIndex=0;
					break;
				case INDEX_MATCH_CLEAR:
					ds_list_copy(unSeletedTeams,global.thisGame.teamManager.teams);
					ds_list_clear(ins_match.teams);
					break;
				case INDEX_MATCH_SELECT_RULE:
					matchRoomState=MatchRoomState.SELECTING_RULE;	
					selectedRuleIndex=0;
					break;		
				case INDEX_MATCH_START:
					var curNumTeam=ds_list_size(ins_match.teams);
					var limit=ds_list_find_value(global.thisGame.ruleManager.teamNumLimits,curRuleIndex);
					if(limit<1||curNumTeam<=limit){
						setRuleToMatch(ins_match,curRuleIndex);
						room_goto(room_play);
					}
					else{
						show_message("当前规则下,参赛队伍数目应为："+string(limit)+",目前准备参赛的队伍数目为："+string(curNumTeam));
					}
					break;			
			}
		}
		else if(isB){
			instance_destroy(ins_match);
			room_goto(room_mainMenu);		
			return;

		}
		else if(input_dy!=0){
			selectedOperationIndex=clamp(selectedOperationIndex+input_dy,0,array_length_1d(MATCH_OPERATION_TEXTS)-1);
		}
		break;
	case MatchRoomState.SELECTING_TEAM:
		if(isA){
			if(selectedTeamIndex!=-1){
				var ins_team=ds_list_find_value(unSeletedTeams,selectedTeamIndex);
				//var pos=ds_list_find_index(unSeletedTeams,ins_team);
				//var isNotInMatch=(pos==-1);
				//if(isNotInMatch){
					ds_list_add(ins_match.teams,ins_team);	
					ds_list_add(ins_match.usedTime,0);	
					ds_list_add(ins_match.numCorrectAnswer,0);	
					ds_list_add(ins_match.numWrongAnswer,0);				
					ds_list_delete(unSeletedTeams,selectedTeamIndex);
					selectedTeamIndex=-1;
					matchRoomState=MatchRoomState.SELECTING_MATCH_OPERATION;
				//}
				
				
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
		
	case MatchRoomState.SELECTING_RULE:
		if(isA){
			if(selectedRuleIndex!=-1){
				curRuleIndex=selectedRuleIndex;
				selectedTeamIndex=-1;
				matchRoomState=MatchRoomState.SELECTING_MATCH_OPERATION;	
			}
		}
		else if(isB){	
			matchRoomState=MatchRoomState.SELECTING_MATCH_OPERATION;		
			selectedRuleIndex=-1;		
		}
		else if(input_dy!=0){
			selectedRuleIndex=clamp(selectedRuleIndex+input_dy,0,ds_list_size(global.thisGame.ruleManager.ruleNames)-1);
		}
		break;		
		
}