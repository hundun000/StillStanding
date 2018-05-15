///@argument0 ruleManager
var manager=argument0;


ds_list_clear(manager.ruleNames);
ds_list_clear(manager.blockTimeLimits);
ds_list_clear(manager.matchBlockNumLimits);
ds_list_clear(manager.matchWrongLimits);


ds_list_add(manager.ruleNames,"单人初赛");
ds_list_add(manager.blockTimeLimits,-1);
ds_list_add(manager.matchBlockNumLimits,5);
ds_list_add(manager.matchWrongLimits,-1);
ds_list_add(manager.switchBlockNumLimits,-1);

ds_list_add(manager.ruleNames,"轮换复赛");
ds_list_add(manager.blockTimeLimits,20);
ds_list_add(manager.matchBlockNumLimits,-1);
ds_list_add(manager.matchWrongLimits,2);
ds_list_add(manager.switchBlockNumLimits,1);

saveRules(manager);