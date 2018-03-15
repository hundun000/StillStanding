///@argument0 groupName

var groupName=argument0;
var ans;

var fileRead;
fileRead=file_text_open_read(working_directory+DIRECTORY_GROUP+groupName+".txt");
if(fileRead==-1){
	show_message("fileRead error");
	return noone;
}

var numBlock;
numBlock=file_text_read_real(fileRead); file_text_readln(fileRead); 

file_text_close(fileRead);
return numBlock;