var file;
file = get_open_filename("题库|*.txt", "");
if(file!=""){
	
	var fileName=filename_name(file);
	var groupName=string_copy(fileName,1,string_length(fileName)-4);//".txt".length==4
	
	var groupList=global.groupManager.groupNames;
	var groupNumBlockList=global.groupManager.groupNumBlocks;
	var groupNumUsedBlockList=global.groupManager.groupNumUsedBlocks;
	
	if(ds_list_find_index(groupList,groupName)==-1){
			
		//-----------write to sandbox------------------
		var fileRead = file_text_open_read(file);
		var fileWrite =file_text_open_write(working_directory+DIRECTORY_GROUP+groupName+".txt");	
		var nextLine;
		while (!file_text_eoln(fileRead)){
			nextLine=file_text_readln(fileRead);
			file_text_write_string(fileWrite,nextLine);
		}
		file_text_close(fileRead);
		file_text_close(fileWrite);
				
				
		//---------load into groupManager------------
		ds_list_add(groupList,groupName);
		var numBlock=loadGroupsNumBlockByName(groupName);
		ds_list_add(groupNumBlockList,numBlock);
		ds_list_add(groupNumUsedBlockList,0);
	}
	else{
		show_message("外部导入时，题类已存在");	
	}
	

	

}