/// @description Insert description here
// You can write your code in this editor
if(manager.selectedRuleIndex>=0){
	var i;
	var x_draw=x;
	var y_text=y;
	var space=117;

	draw_set_color(c_black);
	draw_set_font(manager.ROOM_FONT);

	var value;
	var text;
	value[0]=ds_list_find_value(manager.ruleNames,manager.selectedRuleIndex);
	value[1]=ds_list_find_value(manager.blockTimeLimits,manager.selectedRuleIndex);
	value[2]=ds_list_find_value(manager.matchBlockNumLimits,manager.selectedRuleIndex);
	value[3]=ds_list_find_value(manager.matchWrongLimits,manager.selectedRuleIndex);
	value[4]=ds_list_find_value(manager.switchBlockNumLimits,manager.selectedRuleIndex);
	value[5]=ds_list_find_value(manager.teamNumLimits,manager.selectedRuleIndex);
	
	draw_text(x_draw,y_text+0*space,INFO_TEXTS[0]+value[0]);
	for(i=1;i<array_length_1d(INFO_TEXTS);i++){
		if(value[i]==-1)
			text=INFO_TEXTS[i]+"无限制";
		else
			text=INFO_TEXTS[i]+string(value[i]);
		draw_text(x_draw,y_text+i*space,text);
	}



}