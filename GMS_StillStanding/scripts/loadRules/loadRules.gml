///@argument0 filePath_noone_as_using_sandbox_file
var manager=global.thisGame.ruleManager;
var filePath=argument0;

var targetPath;
if(filePath==noone){
	var outsidePath=working_directory+"比赛规则.txt"
	var sandboxPath=working_directory+DIRECTORY_SANDBOX+"比赛规则.txt";
	
	if(file_exists(sandboxPath))
		targetPath=sandboxPath;
	else	
		targetPath=outsidePath;
}
else
	targetPath=file_text_open_read(filePath);
	
if(!file_exists(targetPath)){
	show_message("规则文件不存在");
	return noone;
}


//var fileRead=file_text_open_read(filePath);
	
ini_open(targetPath);

var defultValue=-1;
var sectionName;
var i,j;

ds_list_clear(manager.ruleNames);
ds_list_clear(manager.blockTimeLimits);
ds_list_clear(manager.matchBlockNumLimits);
ds_list_clear(manager.matchWrongLimits);
ds_list_clear(manager.switchBlockNumLimits);
ds_list_clear(manager.teamNumLimits);

sectionName="Rules parameters";
var numRule=ini_read_real(sectionName,"numRule",defultValue);
for(i=0;i<numRule;i++){
	var in_name=ini_read_string(sectionName,"rule_"+string(i)+"_name",defultValue);
	var in_blockTimeLimit=ini_read_real(sectionName,"rule_"+string(i)+"_blockTimeLimit",defultValue);
	var in_matchBlockNumLimit=ini_read_real(sectionName,"rule_"+string(i)+"_matchBlockNumLimit",defultValue);
	var in_matchWrongLimit=ini_read_real(sectionName,"rule_"+string(i)+"_matchWrongLimit",defultValue);
	var in_switchBlockNumLimit=ini_read_real(sectionName,"rule_"+string(i)+"_switchBlockNumLimit",defultValue);
	var in_teamNumLimit=ini_read_real(sectionName,"rule_"+string(i)+"_teamNumLimit",defultValue);
	
	ds_list_add(manager.ruleNames,in_name);
	ds_list_add(manager.blockTimeLimits,in_blockTimeLimit);
	ds_list_add(manager.matchBlockNumLimits,in_matchBlockNumLimit);
	ds_list_add(manager.matchWrongLimits,in_matchWrongLimit);
	ds_list_add(manager.switchBlockNumLimits,in_switchBlockNumLimit);
	ds_list_add(manager.teamNumLimits,in_teamNumLimit);
}

ini_close();