var manager=global.thisGame.ruleManager;


ds_list_clear(manager.ruleNames);
ds_list_clear(manager.blockTimeLimits);
ds_list_clear(manager.matchBlockNumLimits);
ds_list_clear(manager.matchWrongLimits);
ds_list_clear(manager.teamNumLimits);

ds_list_add(manager.ruleNames,"默认单人赛规则");
ds_list_add(manager.blockTimeLimits,1);
ds_list_add(manager.matchBlockNumLimits,1);
ds_list_add(manager.matchWrongLimits,1);
ds_list_add(manager.switchBlockNumLimits,1);
ds_list_add(manager.teamNumLimits,1);

ds_list_add(manager.ruleNames,"默认双人赛规则");
ds_list_add(manager.blockTimeLimits,2);
ds_list_add(manager.matchBlockNumLimits,2);
ds_list_add(manager.matchWrongLimits,2);
ds_list_add(manager.switchBlockNumLimits,2);
ds_list_add(manager.teamNumLimits,2);

saveRules();