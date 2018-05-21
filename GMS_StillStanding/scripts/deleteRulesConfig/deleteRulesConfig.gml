var manager=global.thisGame.ruleManager;


ds_list_clear(manager.ruleNames);
ds_list_clear(manager.blockTimeLimits);
ds_list_clear(manager.matchBlockNumLimits);
ds_list_clear(manager.matchWrongLimits);
ds_list_clear(manager.teamNumLimits);

if(file_exists(working_directory+DIRECTORY_SANDBOX+"比赛规则.txt"))
	file_delete(working_directory+DIRECTORY_SANDBOX+"比赛规则.txt");