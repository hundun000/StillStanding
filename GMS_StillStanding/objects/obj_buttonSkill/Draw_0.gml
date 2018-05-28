/// @description Insert description here
// You can write your code in this editor
draw_self();
if(image_index!=INDEX_UNUSABLE){
	draw_set_color(c_orange);
	
	var ins_team=ds_list_find_value(manager.ins_match.teams,manager.curTeamIndex);
	draw_text(x,y,string(ins_team.numSkillChance[index]));
}