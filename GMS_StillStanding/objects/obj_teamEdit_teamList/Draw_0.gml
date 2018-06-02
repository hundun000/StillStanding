/// @description Insert description here
// You can write your code in this editor
	draw_set_font(font);
	
	var i;
	var x_draw=x;
	var y_text=y;
	var space=20+font_get_size(font);

	var size=ds_list_size(manager.teams);
	if(size>0){
		for(i=0;i<size;i++){
			var ins_team=ds_list_find_value(manager.teams,i);
			var text=ins_team.name;
			text+="("+string(ds_list_size(ins_team.banGroupNames))+"/"+string(ds_list_size(ins_team.pickGroupNames))+")";
			if(i==manager.selectedTeamIndex){
				draw_set_color(c_white);
				if(manager.teamRoomState==TeamRoomState.SELECTING_TEAM)
					text+="<<";
				else if(manager.teamRoomState==TeamRoomState.SELECTING_BAN||manager.teamRoomState==TeamRoomState.SELECTING_PICK)
					text+=">>";
			}
			else{
				draw_set_color(c_black);
			}
			//text+=" score:"+string(ins_team.sumCorrectAnswer);
			draw_text(x_draw,y_text+i*space,text);
		}
	}
	else{
		draw_set_color(c_black);
		draw_text(x_draw,y_text,"无");
	}
	
