var groupList=global.groupManager.groupNames;
var groupNumBlockList=global.groupManager.groupNumBlocks;
var groupNumUsedBlockList=global.groupManager.groupNumUsedBlocks;

ds_list_clear(groupList);
ds_list_clear(groupNumBlockList);
ds_list_clear(groupNumUsedBlockList);

var fileNameRead;

if(directory_exists(working_directory+DIRECTORY_GROUP))
{
	fileNameRead = file_find_first(working_directory+DIRECTORY_GROUP+"*.txt", 0);

	while(fileNameRead!=""){
		var groupName=string_copy(fileNameRead,1,string_length(fileNameRead)-4);//".txt".length==4
		if(ds_list_find_index(groupList,groupName)==-1){
			ds_list_add(groupList,groupName);
			var numBlock=loadGroupsNumBlockByName(groupName);
			ds_list_add(groupNumBlockList,numBlock);
			ds_list_add(groupNumUsedBlockList,0);
		}
		
		fileNameRead=file_find_next();
	}

	file_find_close();
}

