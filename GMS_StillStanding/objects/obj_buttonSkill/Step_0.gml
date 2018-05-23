/// @description Insert description here
// You can write your code in this editor
if(image_index==0){
	if(frameCounter++==GAME_FPS*2){
		image_index=index+INDEX_OFFSET;	
		frameCounter=0;
	}
}
else{
	var ins_team=ds_list_find_value(manager.ins_match.teams,manager.curTeamIndex);
	if(ins_team.numSkillChance[index]==0){
		image_index=INDEX_UNUSABLE;
	}
	else
		image_index=index+INDEX_OFFSET;	
}