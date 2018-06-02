/// @description Insert description here
// You can write your code in this editor
if(roomManager.ruleRoomState==RuleRoomState.SELECTING_RULE){
	var i;
	var x_draw=x;
	var y_text=y;
	var space=125;
	draw_set_font(roomManager.ROOM_FONT);

	var size=ds_list_size(dataManager.ruleNames);
	if(size==0){
		draw_text(x_draw,y_text,"无");
	}
	else{
		for(i=0;i<size;i++){	
			var name=ds_list_find_value(dataManager.ruleNames,i);
			if(i==roomManager.selectedRuleIndex){
				draw_set_color(c_white);
				draw_text(x_draw,y_text+i*space,name+"<<");
			}
			else{
				draw_set_color(c_black);
				draw_text(x_draw,y_text+i*space,name);
			}
		}
	}
}