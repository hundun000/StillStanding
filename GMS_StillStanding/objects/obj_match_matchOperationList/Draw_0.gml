

	var i;
	var x_text=x;
	var y_text=y;
	var space=20;
	var drawText;

	var size=array_length_1d(roomManager.MATCH_OPERATION_TEXTS);
	for(i=0;i<size;i++){
		drawText=roomManager.MATCH_OPERATION_TEXTS[i];
		if(i==roomManager.selectedMatchOperationIndex){
			draw_set_color(c_orange);
			if(roomManager.matchRoomState==MatchRoomState.SELECTING_MATCH_OPERATION)
				drawText+="<<";
			else
				drawText+=">>";
		}
		else{
			draw_set_color(c_black);	
		}
		draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),drawText);
	}
