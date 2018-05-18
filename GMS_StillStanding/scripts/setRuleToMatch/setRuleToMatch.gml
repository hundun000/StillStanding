///@argument0 ins_match
///@argument1 matchType
var ins_match=argument0;
var ruleIndex=argument1;

ins_match.ruleName=ds_list_find_value(global.thisGame.ruleManager.ruleNames,ruleIndex);
ins_match.blockTimeLimit=ds_list_find_value(global.thisGame.ruleManager.blockTimeLimits,ruleIndex);
ins_match.matchBlockNumLimit=ds_list_find_value(global.thisGame.ruleManager.matchBlockNumLimits,ruleIndex);
ins_match.matchWrongLimit=ds_list_find_value(global.thisGame.ruleManager.matchWrongLimits,ruleIndex);
ins_match.switchBlockNumLimit=ds_list_find_value(global.thisGame.ruleManager.switchBlockNumLimits,ruleIndex);