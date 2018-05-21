/// @description Insert description here
// You can write your code in this editor
image_index=0;
var fileNameRead;
if(directory_exists(DIRECTORY_GROUP))
{
	show_message("open from DIRECTORY_GROUP");
	
	fileNameRead = file_find_first(DIRECTORY_GROUP+"*.txt", 0);

	while(fileNameRead!=""){
		var groupName=string_copy(fileNameRead,1,string_length(fileNameRead)-4);//".txt".length==4
		show_message(groupName);
		
		fileNameRead=file_find_next();
	}

	file_find_close();
}
else if(directory_exists(working_directory+DIRECTORY_GROUP)){
	show_message("open from working_directory+DIRECTORY_GROUP");
	
	fileNameRead = file_find_first(working_directory+DIRECTORY_GROUP+"*.txt", 0);

	while(fileNameRead!=""){
		var groupName=string_copy(fileNameRead,1,string_length(fileNameRead)-4);//".txt".length==4
		show_message(groupName);
		
		fileNameRead=file_find_next();
	}

	file_find_close();
	
}
	
	
	