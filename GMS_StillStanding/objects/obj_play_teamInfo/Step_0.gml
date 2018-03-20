/// @description Insert description here
// You can write your code in this editor

if(manager.ins_match!=noone){
	
	if(index==manager.curTeamIndex)
		color=c_orange;
	else
		color=c_black;
	
	var sec=ds_list_find_value(manager.ins_match.usedTime,index);
	var leftSec=manager.ins_match.timeLimit-sec;
	var minute=leftSec div 60;
	var seccond=leftSec mod 60;
	
	var ins_team=ds_list_find_value(manager.ins_match.teams,index);
	text="";
	text+=ins_team.name+" ";
	if(leftSec>0)
		text+="TimeLeft "+intergeToTwoBitString(minute)+":"+intergeToTwoBitString(seccond)+" ";
	text+="Corrext:"+string(ds_list_find_value(manager.ins_match.numCorrectAnswer,index));
	text+="Wrong:"+string(ds_list_find_value(manager.ins_match.numWrongAnswer,index));
	
	if(manager.curTeamIndex==index&&manager.isGameTimeGoes)
		image_index=1;
	else
		image_index=0;
	
}
	
