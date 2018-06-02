/// @description Insert description here
// You can write your code in this editor
if(roomManager.matchRoomState==MatchRoomState.SELECTING_TEAM){
	var i;
	var x_draw=x;
	var y_text=y;
	var space=20+font_get_size(font);
	draw_set_font(font);
	var size=ds_list_size(roomManager.unSeletedTeams);
	if(size==0){
		draw_text(x_draw,y_text,"无");
	}
	else{
		for(i=0;i<size;i++){
			var ins_team=ds_list_find_value(roomManager.unSeletedTeams,i);
	
			if(i==roomManager.selectedTeamIndex){
				draw_set_color(c_white);
				draw_text(x_draw,y_text+i*space,ins_team.name+"<<");
			}
			else{
				draw_set_color(c_black);
				draw_text(x_draw,y_text+i*space,ins_team.name);
			}
		
		}
	}
}