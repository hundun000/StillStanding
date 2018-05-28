/// @description Insert description here
// You can write your code in this editor
if(roomManager.groupRoomState==GroupRoomState.SELECTING_BAN){
	var i;
	var x_text=x;
	var y_text=y;
	var space=20;
	draw_set_font(roomManager.ROOM_FONT);

	var size=ds_list_size(dataManager.banableGroupNames);
	if(size==0){
		draw_text(x_text,y_text,"无");
	}
	else{
		for(i=0;i<size;i++){	
			var name=ds_list_find_value(dataManager.banableGroupNames,i);
			if(i==roomManager.selectedGroupIndex){
				draw_set_color(c_orange);
				draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),name+"<<");
			}
			else{
				draw_set_color(c_black);
				draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),name);
			}
		}
	}
}