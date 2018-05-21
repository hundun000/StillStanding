/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.RULE_MANAGER)	return;

switch(ruleRoomState){
	case RuleRoomState.SELECTING_RULE_OPERATION:
		if(isA){
			switch(selectedOperationIndex){
				case INDEX_RULE_SHOW:
					ruleRoomState=RuleRoomState.SELECTING_RULE;	
					if(ds_list_size(ruleNames)!=0)
						selectedRuleIndex=0;
					break;
				case INDEX_RULE_ADD:
					//inputRuleFile();
					break;
				case INDEX_RULE_RESET:
					deleteRulesConfig();
					loadRules(noone);
					break;		
		
			}
		}
		else if(isB){
			saveRules();
			room_goto(room_mainMenu);		
			return;
		}
		else if(input_dy!=0){
			selectedOperationIndex=clamp(selectedOperationIndex+input_dy,0,array_length_1d(OPERATION_TEXTS)-1);
		}
		break;		
	case RuleRoomState.SELECTING_RULE:
		if(isB){	
			ruleRoomState=RuleRoomState.SELECTING_RULE_OPERATION;		
			selectedRuleIndex=-1;		
		}
		else if(input_dy!=0){
			selectedRuleIndex=clamp(selectedRuleIndex+input_dy,0,ds_list_size(ruleNames)-1);
		}
		break;	
	
}