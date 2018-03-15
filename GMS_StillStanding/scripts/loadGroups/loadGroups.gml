///@argument0 groupList
///@argument1 groupNumBlockList
///@argument2 groupNumUsedBlockList

var groupList=argument0;
var groupNumBlockList=argument1;
var groupNumUsedBlockList=argument2;

ds_list_clear(groupList);

var fileNameRead;

if directory_exists(working_directory+DIRECTORY_GROUP)
{
	fileNameRead = file_find_first(working_directory+DIRECTORY_GROUP+"*.txt", 0);

	while(fileNameRead!=""){
		var groupName=string_copy(fileNameRead,1,string_length(fileNameRead)-4);//".txt".length==4
		ds_list_add(groupList,groupName);
		var numBlock=loadGroupsNumBlock(groupName);
		ds_list_add(groupNumBlockList,numBlock);
		ds_list_add(groupNumUsedBlockList,0);
		
		fileNameRead=file_find_next();
	}

	file_find_close();
}

