///@argument0 ruleManager
var manager=argument0;

var newFilePath=working_directory+"比赛规则.txt";
var lastFilePath=working_directory+"比赛规则.txt";
if(file_exists(newFilePath)){
	if(file_exists(lastFilePath)) file_delete(lastFilePath);
	file_rename(newFilePath,newFilePath);
}
ini_open(newFilePath);

var sectionName;
var i,j;

sectionName="Rules parameters";
var numRule=ds_list_size(manager.ruleNames);
ini_write_real(sectionName,"numRule",numRule);
for(i=0;i<numRule;i++){
	var out_name=ds_list_find_value(manager.ruleNames,i);
	var out_blockTimeLimit=ds_list_find_value(manager.blockTimeLimits,i);
	var out_matchBlockNumLimit=ds_list_find_value(manager.matchBlockNumLimits,i);
	var out_matchWrongLimit=ds_list_find_value(manager.matchWrongLimits,i);
	var out_switchBlockNumLimit=ds_list_find_value(manager.switchBlockNumLimits,i);
	ini_write_string(sectionName,"rule_"+string(i)+"_name",out_name);
	ini_write_real(sectionName,"rule_"+string(i)+"_blockTimeLimit",out_blockTimeLimit);
	ini_write_real(sectionName,"rule_"+string(i)+"_matchBlockNumLimit",out_matchBlockNumLimit);
	ini_write_real(sectionName,"rule_"+string(i)+"_matchWrongLimit",out_matchWrongLimit);
	ini_write_real(sectionName,"rule_"+string(i)+"_switchBlockNumLimit",out_switchBlockNumLimit);
}

ini_close();
