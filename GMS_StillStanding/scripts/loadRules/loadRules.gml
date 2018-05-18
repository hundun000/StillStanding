///@argument0 filePath_noone_as_using_sandbox_file
var manager=global.thisGame.ruleManager;
var filePath=argument0;


if(filePath==noone)
	filePath=working_directory+"比赛规则.txt";

var fileRead=file_text_open_read(filePath);
	
if(!file_exists(fileRead)){
	saveAndSetDefaultRules(manager);
	return;
}

ini_open(fileRead);

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
	var in_teamNumLimit=ini_read_real(sectionName,"rule_"+string(i)+"_teamNumLimit",defultValue);
	
	ds_list_add(manager.ruleNames,in_name);
	ds_list_add(manager.blockTimeLimits,in_blockTimeLimit);
	ds_list_add(manager.matchBlockNumLimits,in_matchBlockNumLimit);
	ds_list_add(manager.matchWrongLimits,in_matchWrongLimit);
	ds_list_add(manager.switchBlockNumLimits,in_switchBlockNumLimit);
	ds_list_add(manager.teamNumLimits,in_teamNumLimit);
}

ini_close();