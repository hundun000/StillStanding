/// @description Insert description here
// You can write your code in this editor
if(manager.selectedGroupIndex>=0){
	var i;
	var x_text=x;
	var y_text=y;
	var space=20;

	draw_set_color(c_black);
	draw_set_font(manager.ROOM_FONT);

	var value;
	var text;
	
	var managerGroupName=ds_list_find_value(manager.groupNames,manager.selectedGroupIndex);
	if(curGroupName!=managerGroupName){
		curGroupName=managerGroupName;
		curGroupNumBlock=loadGroupsNumBlockByName(curGroupName);
	}

	draw_text(x_text,y_text+0*(font_get_size(manager.ROOM_FONT)+space),INFO_TEXTS[0]+curGroupName);
	draw_text(x_text,y_text+1*(font_get_size(manager.ROOM_FONT)+space),INFO_TEXTS[1]+string(curGroupNumBlock));



}