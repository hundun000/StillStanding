/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.TEAM_MANAGER)	return;

switch(teamRoomState){
	
	case TeamRoomState.SELECTING_TEAM:
		if(isA){
			teamRoomState=TeamRoomState.SELECTING_GROUP;			
			selectedGroupIndex=0;
		}
		else if(isB){
			room_goto(room_mainMenu);	
			return;
		}
		else if(input_dy!=0){
			selectedTeamIndex=clamp(selectedTeamIndex+input_dy,0,ds_list_size(teams)-1);
		}
		break;
	case TeamRoomState.SELECTING_GROUP:	
		if(isA){
			//toggle ban state
			var ins_selectedTeam=ds_list_find_value(teams,selectedTeamIndex);
			var groupName=ds_list_find_value(global.groupManager.groupNames,selectedGroupIndex);
			var pos=ds_list_find_index(ins_selectedTeam.banGroupNames,groupName);
			var isBan=(pos!=-1);
			if(isBan){
				ds_list_delete(ins_selectedTeam.banGroupNames,pos);
			}
			else{
				ds_list_add(ins_selectedTeam.banGroupNames,groupName);
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

