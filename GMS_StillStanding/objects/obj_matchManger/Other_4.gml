/// @description Insert description here
// You can write your code in this editor
if(room==room_match){
	global.inputReceiver=InputReceiver.MATCH_MANAGER;
	
	draw_set_font(ROOM_FONT);
	
	matchRoomState=MatchRoomState.SELECTING_MATCH_OPERATION;
	
	selectedTeamIndex=-1;
		
	selectedOperationIndex=0;
	
	ins_match=instance_create_depth(0,0,DEPTH_MANAGER,obj_match);
	
	if(ds_list_size(global.thisGame.ruleManager.ruleNames)!=0)
		curRuleIndex=0;
	
	//when room start,all teams are unselected.
	ds_list_copy(unSeletedTeams,global.thisGame.teamManager.teams);
		
}