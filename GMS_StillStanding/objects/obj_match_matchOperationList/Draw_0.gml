

	var i;
	var x_draw=x;
	var y_text=y;
	var space=20;
	var drawText;
	draw_set_font(roomManager.ROOM_FONT);
	
	var size=array_length_1d(roomManager.MATCH_OPERATION_TEXTS);
	for(i=0;i<size;i++){
		drawText=roomManager.MATCH_OPERATION_TEXTS[i];
		if(i==roomManager.selectedOperationIndex){
			draw_set_color(c_white);
			if(roomManager.matchRoomState==MatchRoomState.SELECTING_MATCH_OPERATION)
				drawText+="<<";
			else
				drawText+=">>";
		}
		else{
			draw_set_color(c_black);	
		}
		draw_text(x_draw,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),drawText);
	}
