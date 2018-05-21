/// @description Insert description here
// You can write your code in this editor
event_inherited();

enum RuleRoomState{
	SELECTING_RULE,
	SELECTING_RULE_OPERATION	
}

ROOM_FONT=global.font_CN_typeBox;
ruleRoomState=noone;
selectedOperationIndex=-1;
selectedRuleIndex=-1;

ruleNames=ds_list_create();
blockTimeLimits=ds_list_create();
matchBlockNumLimits=ds_list_create();
matchWrongLimits=ds_list_create();
switchBlockNumLimits=ds_list_create();
teamNumLimits=ds_list_create();


#macro INDEX_RULE_SHOW 0
#macro INDEX_RULE_ADD 1
#macro INDEX_RULE_RESET 2

OPERATION_TEXTS[INDEX_RULE_SHOW]="查看所有规则";
OPERATION_TEXTS[INDEX_RULE_ADD]="[暂无功能]";
OPERATION_TEXTS[INDEX_RULE_RESET]="清除当前规则并导入规则文件";