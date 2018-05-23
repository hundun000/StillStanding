/// @description Insert description here
// You can write your code in this editor
#macro FULL_PICK_CHANCE 2

name=noone;
banGroupNames=ds_list_create();
pickGroupNames=ds_list_create();

numMatch=0;
sumCorrectAnswer=0;
sumWrongAnswer=0;



numPickChance=-1;

#macro INDEX_SKILL_SKIP 0
#macro INDEX_SKILL_SEE_WRONG 1
#macro INDEX_SKILL_CALL_HELP 2
numSkillChance[INDEX_SKILL_SKIP]=-1;
numSkillChance[INDEX_SKILL_SEE_WRONG]=-1;
numSkillChance[INDEX_SKILL_CALL_HELP]=-1;
