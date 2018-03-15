/// @description Insert description here
// You can write your code in this editor
if(roomManager.matchRoomState==MatchRoomState.SELECTING_TEAM){
	var i;
	var x_text=x;
	var y_text=y;
	var space=20;

	var size=ds_list_size(dataManager.teams);
	for(i=0;i<size;i++){
		var ins_team=ds_list_find_value(dataManager.teams,i);
	
		if(i==roomManager.selectedTeamIndex){
			draw_set_color(c_orange);
			draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),ins_team.name+"<<");
		}
		else{
			draw_set_color(c_black);
			draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),ins_team.name);
		}
		
	}
}