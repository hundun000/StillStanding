/// @description Insert description here
// You can write your code in this editor

if(manager.ins_match!=noone){
	var sec=ds_list_find_value(manager.ins_match.usedTime,manager.curTeamIndex);
	var leftSec=manager.ins_match.timeLimit-sec;
	var minute=sec div 60;
	var seccond=sec mod 60;
	
	var ins_team=ds_list_find_value(manager.ins_match.teams,manager.curTeamIndex);
	text="";
	text+=ins_team.name+" ";
	if(leftSec>0)
		text+="TimeLeft "+intergeToTwoBitString(minute)+":"+intergeToTwoBitString(seccond)+" ";
	text+="Corrext:"+string(ds_list_find_value(manager.ins_match.numCorrectAnswer,manager.curTeamIndex));
	text+="Wrong:"+string(ds_list_find_value(manager.ins_match.numWrongAnswer,manager.curTeamIndex));
}
	
