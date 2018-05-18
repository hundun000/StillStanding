var teamList=global.thisGame.teamManager.teams;


var filePath=working_directory+"参赛队伍.txt";
var fileWrite=file_text_open_write(filePath);
var numTeam;
numTeam=ds_list_size(teamList);
file_text_write_real(fileWrite,numTeam); file_text_writeln(fileWrite); 
file_text_writeln(fileWrite); 
var i;
for(i=0;i<numTeam;i++){
	var ins_nextTeam=ds_list_find_value(teamList,i);
	saveNextTeam(fileWrite,ins_nextTeam);
}

file_text_close(fileWrite);

