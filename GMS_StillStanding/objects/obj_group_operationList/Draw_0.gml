

	var i;
	var x_text=x;
	var y_text=y;
	var space=20;
	var drawText;
	draw_set_font(roomManager.ROOM_FONT);

	var size=array_length_1d(roomManager.OPERATION_TEXTS);
	for(i=0;i<size;i++){
		drawText=roomManager.OPERATION_TEXTS[i];
		if(i==roomManager.selectedOperationIndex){
			draw_set_color(c_orange);
			if(roomManager.groupRoomState==GroupRoomState.SELECTING_GROUP_OPERATION)
				drawText+="<<";
			else
				drawText+=">>";
		}
		else{
			draw_set_color(c_black);	
		}
		draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),drawText);
	}
