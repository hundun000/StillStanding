///@argument0 teamList

var teamList=argument0;

ds_list_clear(teamList);

var fileRead;
fileRead=file_text_open_read(working_directory+"参赛队伍.txt");
if(fileRead==-1){
	show_message("teamload file error");
	return noone;
}

var numTeam;
numTeam=file_text_read_real(fileRead); file_text_readln(fileRead); 
var i;
for(i=0;i<numTeam;i++){
	var ins_nextTeam=readNextTeam(fileRead);
	ds_list_add(teamList,ins_nextTeam);
}

file_text_close(fileRead);