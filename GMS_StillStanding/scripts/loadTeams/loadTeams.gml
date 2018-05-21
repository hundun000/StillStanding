///@argument0 filePath_noone_as_using_sandbox_file
var teamList=global.thisGame.teamManager.teams;
var filePath=argument0;


var fileRead;
if(filePath==noone){
	var outsidePath=working_directory+"参赛队伍.txt"
	var sandboxPath=working_directory+DIRECTORY_SANDBOX+"参赛队伍.txt";
	
	if(file_exists(sandboxPath))
		fileRead=file_text_open_read(sandboxPath);
	else	
		fileRead=file_text_open_read(outsidePath);
}
else
	fileRead=file_text_open_read(filePath);
	
if(fileRead==-1){
	show_message("队伍设置文件不存在");
	return noone;
}

ds_list_clear(teamList);
instance_destroy(obj_team);

var numTeam;
numTeam=file_text_read_real(fileRead); file_text_readln(fileRead); 
file_text_readln(fileRead); 
var i;
for(i=0;i<numTeam;i++){
	var ins_nextTeam=readNextTeam(fileRead);
	ds_list_add(teamList,ins_nextTeam);
}

file_text_close(fileRead);