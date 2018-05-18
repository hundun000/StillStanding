/// @description Insert description here
// You can write your code in this editor
event_inherited();

enum TeamRoomState{
	SELECTING_TEAM_OPERATION,
	SELECTING_TEAM,	
	SELECTING_GROUP,
}

ROOM_FONT=global.font_CN_teamEdit;


//actully not need,use as define 
teamRoomState=noone;
teams=ds_list_create();
selectedTeamIndex=-1;
selectedGroupIndex=-1;
selectedOperationIndex=-1;

#macro INDEX_TEAM_SET_BAN 0
#macro INDEX_TEAM_ADD 1
#macro INDEX_TEAM_RESET 2

OPERATION_TEXTS[INDEX_TEAM_SET_BAN]="设置ban题类";
OPERATION_TEXTS[INDEX_TEAM_ADD]="导入队伍";
OPERATION_TEXTS[INDEX_TEAM_RESET]="重置为默认队伍";