/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.TEAM_MANAGER)	return;

switch(teamRoomState){
	case TeamRoomState.SELECTING_TEAM_OPERATION:
		if(isA){
			switch(selectedOperationIndex){
				case INDEX_TEAM_SET_BAN:				
					if(ds_list_size(teams)!=0){
						teamRoomState=TeamRoomState.SELECTING_TEAM;	
						selectedTeamIndex=0;
					}
					break;
				case INDEX_TEAM_SET_PICK:
					if(ds_list_size(teams)!=0){
						teamRoomState=TeamRoomState.SELECTING_TEAM;	
						selectedTeamIndex=0;
					}
					break;	
				case INDEX_TEAM_RESET:
					deleteTeamsConfig();
					loadTeams(noone);
					break;
			}
		}
		else if(isB){
			saveTeams();
			room_goto(room_mainMenu);		
			return;
		}
		else if(input_dy!=0){
			selectedOperationIndex=clamp(selectedOperationIndex+input_dy,0,array_length_1d(OPERATION_TEXTS)-1);
		}
		break;	
	case TeamRoomState.SELECTING_TEAM:
		if(isA){
			if(selectedOperationIndex==INDEX_TEAM_SET_BAN)
				teamRoomState=TeamRoomState.SELECTING_BAN;		
			else
				teamRoomState=TeamRoomState.SELECTING_PICK;	
			selectedGroupIndex=0;
		}
		else if(isB){
			teamRoomState=TeamRoomState.SELECTING_TEAM_OPERATION;	
			selectedTeamIndex=-1;
		}
		else if(input_dy!=0){
			selectedTeamIndex=clamp(selectedTeamIndex+input_dy,0,ds_list_size(teams)-1);
		}
		break;
		
	case TeamRoomState.SELECTING_BAN:	
		if(isA){
			//toggle ban state
			var ins_selectedTeam=ds_list_find_value(teams,selectedTeamIndex);
			var groupName=ds_list_find_value(global.groupManager.banableGroupNames,selectedGroupIndex);
			var pos=ds_list_find_index(ins_selectedTeam.banGroupNames,groupName);
			var isBan=(pos!=-1);
			if(isBan){
				ds_list_delete(ins_selectedTeam.banGroupNames,pos);
			}
			else{
				ds_list_add(ins_selectedTeam.banGroupNames,groupName);
				//cancel pick
				var pickPos=ds_list_find_index(ins_selectedTeam.pickGroupNames,groupName);
				var isPick=(pickPos!=-1);
				if(isPick)
					ds_list_delete(ins_selectedTeam.pickGroupNames,pickPos);
			}
		}
		else if(isB){
			teamRoomState=TeamRoomState.SELECTING_TEAM;
			selectedGroupIndex=-1;	
			return;
		}
		else if(input_dy!=0){
			selectedGroupIndex=clamp(selectedGroupIndex+input_dy,0,ds_list_size(global.groupManager.groupNames)-1);
		}
		break;
		
	case TeamRoomState.SELECTING_PICK:	
		if(isA){
			//toggle pick state
			var ins_selectedTeam=ds_list_find_value(teams,selectedTeamIndex);
			var groupName=ds_list_find_value(global.groupManager.pickableGroupNames,selectedGroupIndex);
			var pos=ds_list_find_index(ins_selectedTeam.pickGroupNames,groupName);
			var isPick=(pos!=-1);
			if(isPick){
				ds_list_delete(ins_selectedTeam.pickGroupNames,pos);
			}
			else{
				ds_list_add(ins_selectedTeam.pickGroupNames,groupName);
				//cancel ban
				var banPos=ds_list_find_index(ins_selectedTeam.banGroupNames,groupName);
				var isBan=(banPos!=-1);
				if(isBan)
					ds_list_delete(ins_selectedTeam.banGroupNames,banPos);
			}
		}
		else if(isB){
			teamRoomState=TeamRoomState.SELECTING_TEAM;
			selectedGroupIndex=-1;	
			return;
		}
		else if(input_dy!=0){
			selectedGroupIndex=clamp(selectedGroupIndex+input_dy,0,ds_list_size(global.groupManager.groupNames)-1);
		}
		break;	
		
		
}

