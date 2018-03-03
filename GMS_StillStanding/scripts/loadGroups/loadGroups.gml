///@argument0 groupList

var groupList=argument0;

ds_list_clear(groupList);

var fileNameRead;

if directory_exists(working_directory+DIRECTORY_GROUP)
{
	fileNameRead = file_find_first(working_directory+DIRECTORY_GROUP+"*.txt", 0);

	while(fileNameRead!=""){
		var groupName=string_copy(fileNameRead,1,string_length(fileNameRead)-4);//".txt".length==4
		ds_list_add(groupList,groupName);
		fileNameRead=file_find_next();
	}

	file_find_close();
}

