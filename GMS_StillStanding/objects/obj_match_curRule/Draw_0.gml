/// @description Insert description here
// You can write your code in this editor
var x_draw=x;
var y_text=y;
var space=20;
draw_set_font(roomManager.ROOM_FONT);
var size=ds_list_size(dataManager.ruleNames);

var name;
if(roomManager.curRuleIndex!=-1)
	name=ds_list_find_value(dataManager.ruleNames,roomManager.curRuleIndex);
else
	name="无";

draw_set_color(c_black);
draw_text(x_draw,y_text,name);

