///@argument0 fileRead
var fileWrite=argument0;
var ins_team=argument1;


file_text_write_string(fileWrite,ins_team.name); file_text_writeln(fileWrite);

var i;

var numBan=ds_list_size(ins_team.banGroupNames);
file_text_write_real(fileWrite,numBan); file_text_writeln(fileWrite); 
for(i=0;i<numBan;i++){
	var banGroupName=ds_list_find_value(ins_team.banGroupNames,i);
	file_text_write_string(fileWrite,banGroupName); file_text_writeln(fileWrite); 
}

var numpick=ds_list_size(ins_team.pickGroupNames);
file_text_write_real(fileWrite,numpick); file_text_writeln(fileWrite); 
for(i=0;i<numpick;i++){
	var pickGroupName=ds_list_find_value(ins_team.pickGroupNames,i);
	file_text_write_string(fileWrite,pickGroupName); file_text_writeln(fileWrite); 
}

file_text_writeln(fileWrite); //blank line