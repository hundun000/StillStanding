/// @description Insert description here
// You can write your code in this editor
if(roomManager.groupRoomState==GroupRoomState.SELECTING_GROUP){
	var i;
	var x_draw=x;
	var y_text=y;
	var x_morePage=x+100;
	var space=96;
	draw_set_font(roomManager.ROOM_FONT);

	var size=ds_list_size(dataManager.groupNames);
	if(size==0){
		draw_text(x_draw,y_text,"无");
	}
	else{
		var sizeOfThisPage=min(roomManager.PAGE_SIZE,size-roomManager.selectedGroupPage*roomManager.PAGE_SIZE);
		for(i=0;i<sizeOfThisPage;i++){	
			var indexOfArray=roomManager.selectedGroupPage*roomManager.PAGE_SIZE+i;
			var name=ds_list_find_value(dataManager.groupNames,indexOfArray);
			
			if(i==roomManager.selectedGroupIndex){
				draw_set_color(c_white);
				name+="<<";
				//draw_sprite(spr_group_groupStart,0,x_draw-64,y_text+i*space);
			}
			else{
				draw_set_color(c_black);		
			}
			draw_text(x_draw,y_text+i*space,name);
		}
		
		var maxPage=size div roomManager.PAGE_SIZE;
		if((size mod roomManager.PAGE_SIZE)!=0)
			maxPage++;
		
		if(roomManager.selectedGroupPage>0)
			draw_sprite(spr_group_morePage,0,x_morePage,y-sprite_get_height(spr_group_morePage));
		
		if(roomManager.selectedGroupPage<maxPage-1)
			draw_sprite(spr_group_morePage,1,x_morePage,y+roomManager.PAGE_SIZE*space+sprite_get_height(spr_group_morePage));
	}
	
	
	
}