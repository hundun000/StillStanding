/// @description Insert description here
// You can write your code in this editor
var i;
var x_text=x;
var y_text=y;
var space=20;

var size=ds_list_size(manager.teams);
for(i=0;i<size;i++){
	var ins_team=ds_list_find_value(manager.teams,i);
	
	if(i==manager.selectedTeamIndex){
		draw_set_color(c_orange);
		if(manager.teamRoomState==TeamRoomState.SELECTING_TEAM)
			draw_text(x_text,y_text+i*(font_get_size(manager.ROOM_FONT)+space),ins_team.name+"<<");
		else
			draw_text(x_text,y_text+i*(font_get_size(manager.ROOM_FONT)+space),ins_team.name+">>");
	}
	else{
		draw_set_color(c_black);
		draw_text(x_text,y_text+i*(font_get_size(manager.ROOM_FONT)+space),ins_team.name);
	}
}