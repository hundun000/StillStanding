/// @description Insert description here
// You can write your code in this editor

if(manager.ins_match!=noone){
	
	if(index==manager.curTeamIndex)
		color=c_orange;
	else
		color=c_black;
	

	
	var ins_team=ds_list_find_value(manager.ins_match.teams,index);
	text="";
	text+=ins_team.name+" ";
	
	text+="Corrext:"+string(ds_list_find_value(manager.ins_match.numCorrectAnswer,index));
	text+="Wrong:"+string(ds_list_find_value(manager.ins_match.numWrongAnswer,index));
	

	
}
	
