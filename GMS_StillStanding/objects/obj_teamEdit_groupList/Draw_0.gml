var i;
var x_text=x;
var y_text=y;
var space=20;

if(roomManager.teamRoomState==TeamRoomState.SELECTING_BAN){

	var size=ds_list_size(dataManager.groupNames);
	var strDraw;
	
	if(size==0){
		draw_set_color(c_black);
		draw_text(x_text,y_text,"无");
	}
	
	for(i=0;i<size;i++){
		var groupName=ds_list_find_value(dataManager.groupNames,i);
		strDraw=groupName;
	
		if(i==roomManager.selectedGroupIndex){
			draw_set_color(c_orange);
			strDraw+="<<";
		}
		else{
			draw_set_color(c_black);	
		}
		
		var ins_selectedTeam=ds_list_find_value(roomManager.teams,roomManager.selectedTeamIndex);	
		var isBan=(ds_list_find_index(ins_selectedTeam.banGroupNames,groupName)!=-1);
		if(isBan)
			strDraw+="[BAN!]";
		var isPick=(ds_list_find_index(ins_selectedTeam.pickGroupNames,groupName)!=-1);
		if(isPick)
			strDraw+="[PICK!]";	
	
		draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),strDraw);
	}
}
else if(roomManager.teamRoomState==TeamRoomState.SELECTING_PICK){
	var size=ds_list_size(dataManager.pickableGroupNames);
	var strDraw;
	
	if(size==0){
		draw_set_color(c_black);
		draw_text(x_text,y_text,"无");
	}
		
	
	for(i=0;i<size;i++){
		var groupName=ds_list_find_value(dataManager.pickableGroupNames,i);
		strDraw=groupName;
	
		if(i==roomManager.selectedGroupIndex){
			draw_set_color(c_orange);
			strDraw+="<<";
		}
		else{
			draw_set_color(c_black);	
		}
		
		var ins_selectedTeam=ds_list_find_value(roomManager.teams,roomManager.selectedTeamIndex);
		var isBan=(ds_list_find_index(ins_selectedTeam.banGroupNames,groupName)!=-1);
		if(isBan)
			strDraw+="[BAN!]";
		var isPick=(ds_list_find_index(ins_selectedTeam.pickGroupNames,groupName)!=-1);
		if(isPick)
			strDraw+="[PICK!]";	
	
		draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),strDraw);
	}
	
	
	
}