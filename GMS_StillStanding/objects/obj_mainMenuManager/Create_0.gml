/// @description Insert description here
// You can write your code in this editor
event_inherited();

INDEX_MAIN_PLAY=0;
INDEX_MAIN_TEAM=1;
INDEX_MAIN_RULE=2;
INDEX_MAIN_GROUP=3;
INDEX_MAIN_EXIT=4;

option[INDEX_MAIN_PLAY]="答题";
option[INDEX_MAIN_TEAM]="查看参赛队伍";
option[INDEX_MAIN_RULE]="查看答题规则";
option[INDEX_MAIN_GROUP]="查看题库";
option[INDEX_MAIN_EXIT]="退出";
numOption=array_length_1d(option);

//actully not need,use as define 
targetOptionIndex=-1;
