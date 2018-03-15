/// @description Insert description here
// You can write your code in this editor
enum MatchRoomState{
	SELECTING_TEAM,
	SELECTING_MATCH_OPERATION,
	
}

ROOM_FONT=global.font_CN_match;

matchRoomState=noone;
selectedTeamIndex=-1;
selectedMatchOperationIndex=-1;
ins_match=noone;


#macro INDEX_MATCH_ADD_TEAM 0
#macro INDEX_MATCH_CLEAR 1
#macro INDEX_MATCH_START_SINGLE 2
#macro INDEX_MATCH_START_MULTI 3

MATCH_OPERATION_TEXTS[INDEX_MATCH_ADD_TEAM]="添加队伍";
MATCH_OPERATION_TEXTS[INDEX_MATCH_CLEAR]="清空";
MATCH_OPERATION_TEXTS[INDEX_MATCH_START_SINGLE]="开始单人赛";
MATCH_OPERATION_TEXTS[INDEX_MATCH_START_MULTI]="开始多人赛";