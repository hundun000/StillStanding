///@argument0 teamList

var teamList=argument0;

var newFilePath=working_directory+"参赛队伍.txt";
var lastFilePath=working_directory+"参赛队伍（上一版本）.txt";
if(file_exists(newFilePath)){
	if(file_exists(lastFilePath)) file_delete(lastFilePath);
	file_rename(newFilePath,lastFilePath);
}
var fileWrite=file_text_open_write(newFilePath);
var numTeam;
numTeam=ds_list_size(teamList);
file_text_write_real(fileWrite,numTeam); file_text_writeln(fileWrite); 
var i;
for(i=0;i<numTeam;i++){
	var ins_nextTeam=ds_list_find_value(teamList,i);
	saveNextTeam(fileWrite,ins_nextTeam);
}

file_text_close(fileWrite);
if(file_exists(lastFilePath)) file_delete(lastFilePath);
