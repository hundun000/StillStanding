/// @description Insert description here
// You can write your code in this editor
if(manager.selectedGroupIndex>=0){
	var i;
	var x_draw=x;
	var y_text=y;
	var space=125;

	draw_set_color(c_black);
	draw_set_font(manager.ROOM_FONT);

	var value;
	var text;
	
	var indexOfArray=manager.selectedGroupPage*manager.PAGE_SIZE+manager.selectedGroupIndex;
	var groupName=ds_list_find_value(manager.groupNames,indexOfArray);
	if(curGroupName!=groupName){
		curGroupName=groupName;
		curGroupNumBlock=loadGroupsNumBlockByName(curGroupName);
	}

	draw_text(x_draw,y_text+0*space,INFO_TEXTS[0]+curGroupName);
	draw_text(x_draw,y_text+1*space,INFO_TEXTS[1]+string(curGroupNumBlock));



}