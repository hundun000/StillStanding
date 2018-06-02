draw_set_font(roomManager.ROOM_FONT);
var i;
var x_draw=x;
var y_text=y;
var space=20+font_get_size(roomManager.ROOM_FONT);
var x_morePage=x+100;
	
if(roomManager.teamRoomState==TeamRoomState.SELECTING_BAN){

	var size=ds_list_size(dataManager.banableGroupNames);
	var strDraw;
	
	if(size==0){
		draw_set_color(c_black);
		draw_text(x_draw,y_text,"无");
	}
	else{
		var sizeOfThisPage=min(roomManager.PAGE_SIZE,size-roomManager.selectedGroupPage*roomManager.PAGE_SIZE);
		for(i=0;i<sizeOfThisPage;i++){
			var indexOfArray=roomManager.selectedGroupPage*roomManager.PAGE_SIZE+i;
			var groupName=ds_list_find_value(dataManager.banableGroupNames,indexOfArray);
			strDraw=groupName;
	
			if(i==roomManager.selectedGroupIndex){
				draw_set_color(c_white);
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
	
			draw_text(x_draw,y_text+i*space,strDraw);
		}
		
		var maxPage=size div roomManager.PAGE_SIZE;
		if((size mod roomManager.PAGE_SIZE)!=0)
			maxPage++;
		
		if(roomManager.selectedGroupPage>0)
			draw_sprite(spr_group_morePage,0,x_morePage,y-sprite_get_height(spr_group_morePage));
		
		if(roomManager.selectedGroupPage<maxPage-1)
			draw_sprite(spr_group_morePage,1,x_morePage,y+roomManager.PAGE_SIZE*space+sprite_get_height(spr_group_morePage));
		
		draw_set_color(c_black);	
		draw_text(x,y-64,string(roomManager.selectedGroupPage+1)+"/"+string(maxPage));
	
	}
}
else if(roomManager.teamRoomState==TeamRoomState.SELECTING_PICK){
		var size=ds_list_size(dataManager.pickableGroupNames);
	var strDraw;
	
	if(size==0){
		draw_set_color(c_black);
		draw_text(x_draw,y_text,"无");
	}
	else{
		var sizeOfThisPage=min(roomManager.PAGE_SIZE,size-roomManager.selectedGroupPage*roomManager.PAGE_SIZE);
		for(i=0;i<sizeOfThisPage;i++){
			var indexOfArray=roomManager.selectedGroupPage*roomManager.PAGE_SIZE+i;
			var groupName=ds_list_find_value(dataManager.pickableGroupNames,indexOfArray);
			strDraw=groupName;
	
			if(i==roomManager.selectedGroupIndex){
				draw_set_color(c_white);
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
	
			draw_text(x_draw,y_text+i*space,strDraw);
		}
		
		var maxPage=size div roomManager.PAGE_SIZE;
		if((size mod roomManager.PAGE_SIZE)!=0)
			maxPage++;
		
		if(roomManager.selectedGroupPage>0)
			draw_sprite(spr_group_morePage,0,x_morePage,y-sprite_get_height(spr_group_morePage));
		
		if(roomManager.selectedGroupPage<maxPage-1)
			draw_sprite(spr_group_morePage,1,x_morePage,y+roomManager.PAGE_SIZE*space+sprite_get_height(spr_group_morePage));
		
		draw_set_color(c_black);
		draw_text(x,y-64,string(roomManager.selectedGroupPage+1)+"/"+string(maxPage));
	
	}
}