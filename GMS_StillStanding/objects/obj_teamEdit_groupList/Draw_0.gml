if(roomManager.teamRoomState!=TeamRoomState.SELECTING_TEAM_OPERATION){
	var i;
	var x_text=x;
	var y_text=y;
	var space=20;

	var size=ds_list_size(dataManager.groupNames);
	var strDraw;
	for(i=0;i<size;i++){
		var groupName=ds_list_find_value(dataManager.groupNames,i);
		strDraw=groupName;
	
		var ins_selectedTeam=ds_list_find_value(roomManager.teams,roomManager.selectedTeamIndex);
		var isBan=(ds_list_find_index(ins_selectedTeam.banGroupNames,groupName)!=-1);
		if(isBan)
			strDraw+="[BAN!]";
	
	
		if(i==roomManager.selectedGroupIndex){
			draw_set_color(c_orange);
			if(roomManager.teamRoomState==TeamRoomState.SELECTING_GROUP)
				strDraw+="<<";
		}
		else{
			draw_set_color(c_black);	
		}
	
		draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),strDraw);
	}
}