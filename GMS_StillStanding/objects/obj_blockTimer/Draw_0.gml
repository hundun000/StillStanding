/// @description Insert description here
// You can write your code in this editor
draw_self();
var text="";
var x_draw=x+81;
var y_draw=x+191;

var sec=ds_list_find_value(manager.ins_match.usedTimes,manager.curTeamIndex);
if(manager.ins_match.blockTimeLimit>0){
	var leftSec=manager.ins_match.blockTimeLimit+manager.gainBlockTime-sec;
	var minute=leftSec div 60;
	var seccond=leftSec mod 60;
	if(leftSec>0)
		text=intergeToTwoBitString(minute)+":"+intergeToTwoBitString(seccond)+" ";
	else if(leftSec==0)
		text="时间到";
}
else{
	text="无限制";
}

draw_set_font(manager.ROOM_FONT);
draw_set_color(c_black);
	
draw_text(x_draw,y_draw,text);
