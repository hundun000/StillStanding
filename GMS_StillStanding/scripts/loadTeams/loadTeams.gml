///@argument0 filePath_noone_as_using_sandbox_file
var teamList=global.thisGame.teamManager.teams;
var filePath=argument0;



if(filePath==noone)
	filePath=working_directory+"参赛队伍.txt";

var fileRead=file_text_open_read(filePath);
	
if(fileRead==-1){
	show_message("teamload file error");
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