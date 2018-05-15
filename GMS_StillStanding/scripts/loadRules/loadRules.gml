///@argument0 ruleManager
var manager=argument0;

var filePath=working_directory+"比赛规则.txt";
if(!file_exists(filePath)){
	saveDefaultRules(manager);
}

ini_open(filePath);

var defultValue=-1;
var sectionName;
var i,j;

sectionName="Rules parameters";
var numRule=ini_read_real(sectionName,"numRule",defultValue);
for(i=0;i<numRule;i++){
	var in_name=ini_read_string(sectionName,"rule_"+string(i)+"_name",defultValue);
	var in_blockTimeLimit=ini_read_real(sectionName,"rule_"+string(i)+"_blockTimeLimit",defultValue);
	var in_matchBlockNumLimit=ini_read_real(sectionName,"rule_"+string(i)+"_matchBlockNumLimit",defultValue);
	var in_matchWrongLimit=ini_read_real(sectionName,"rule_"+string(i)+"_matchWrongLimit",defultValue);
	var in_switchBlockNumLimit=ini_read_real(sectionName,"rule_"+string(i)+"_switchBlockNumLimit",defultValue);
	
	ds_list_add(manager.ruleNames,in_name);
	ds_list_add(manager.blockTimeLimits,in_blockTimeLimit);
	ds_list_add(manager.matchBlockNumLimits,in_matchBlockNumLimit);
	ds_list_add(manager.matchWrongLimits,in_matchWrongLimit);
	ds_list_add(manager.switchBlockNumLimits,in_switchBlockNumLimit);
}

ini_close();