/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.GROUP_MANAGER)	return;

switch(groupRoomState){
	case GroupRoomState.SELECTING_GROUP_OPERATION:
		if(isA){
			switch(selectedOperationIndex){
				case INDEX_GROUP_SHOW:
					groupRoomState=GroupRoomState.SELECTING_GROUP;	
					if(ds_list_size(groupNames)!=0){
						selectedGroupIndex=0;
						selectedGroupPage=0;
					}
					break;
				case INDEX_GROUP_ADD:
					//inputGroupFile();
					break;	
				case INDEX_GROUP_RESET:
					//saveAndSetDefaultGroups();
					break;	
			}
		}
		else if(isB){
			room_goto(room_mainMenu);		
			return;
		}
		else if(input_dy!=0){
			selectedOperationIndex=clamp(selectedOperationIndex+input_dy,0,array_length_1d(OPERATION_TEXTS)-1);
		}
		break;		
	case GroupRoomState.SELECTING_GROUP:
		if(isB){	
			groupRoomState=GroupRoomState.SELECTING_GROUP_OPERATION;		
			selectedGroupIndex=-1;		
		}
		else if(input_dy!=0){
			var nextIndex=selectedGroupIndex+input_dy;
			var indexOfArray=selectedGroupPage*PAGE_SIZE+nextIndex;
			
			if(indexOfArray>=0&&indexOfArray<ds_list_size(groupNames)){
				if(nextIndex>PAGE_SIZE-1){
					nextIndex=0;
					selectedGroupPage++;
				}
				else if(nextIndex<0){
					nextIndex=PAGE_SIZE-1;
					selectedGroupPage--;
				}
				selectedGroupIndex=nextIndex;
			}	

		}
		break;	
	
}