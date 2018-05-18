///@argument0 fileRead
var fileWrite=argument0;
var ins_team=argument1;


file_text_write_string(fileWrite,ins_team.name); file_text_writeln(fileWrite);
var numBan=ds_list_size(ins_team.banGroupNames);
file_text_write_real(fileWrite,numBan); file_text_writeln(fileWrite); 
var i;
for(i=0;i<numBan;i++){
	var banGroupName=ds_list_find_value(ins_team.banGroupNames,i);
	file_text_write_string(fileWrite,banGroupName); file_text_writeln(fileWrite); 
}
file_text_writeln(fileWrite); 