/// @description Insert description here
// You can write your code in this editor
#macro SUBIMAGE_SELECTED 1
#macro SUBIMAGE_UNSELECTED 0

enum MatchRoomState{
	SELECTING_TEAM,
	SELECTING_MATCH_OPERATION,
	SELECTING_RULE,
}

ROOM_FONT=global.font_CN_match;

matchRoomState=noone;
selectedTeamIndex=-1;
selectedOperationIndex=-1;
selectedRuleIndex=-1;
ins_match=noone;
curRuleIndex=-1;

unSeletedTeams=ds_list_create();

#macro INDEX_MATCH_ADD_TEAM 0
#macro INDEX_MATCH_CLEAR 1
#macro INDEX_MATCH_SELECT_RULE 2
#macro INDEX_MATCH_START 3

MATCH_OPERATION_TEXTS[INDEX_MATCH_ADD_TEAM]="添加队伍";
MATCH_OPERATION_TEXTS[INDEX_MATCH_CLEAR]="清空队伍";
MATCH_OPERATION_TEXTS[INDEX_MATCH_SELECT_RULE]="切换规则";
MATCH_OPERATION_TEXTS[INDEX_MATCH_START]="开始比赛";