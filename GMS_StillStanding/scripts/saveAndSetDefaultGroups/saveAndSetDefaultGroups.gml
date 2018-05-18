if(directory_exists(working_directory+DIRECTORY_GROUP)){
	directory_destroy(working_directory+DIRECTORY_GROUP);
	directory_create(working_directory+DIRECTORY_GROUP);
	
	var fileWrite;
	var groupName;
	var numBlock;
	
	groupName="默认题类1";
	numBlock=1;
	fileWrite=file_text_open_write(working_directory+DIRECTORY_GROUP+groupName+".txt");
	file_text_write_real(fileWrite,numBlock); file_text_writeln(fileWrite);
	
	file_text_write_string(fileWrite,"默认题干 1.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项A 1.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项B 1.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项C 1.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项D 1.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"A"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"无资源"); file_text_writeln(fileWrite);
	
	file_text_close(fileWrite);
	
	
	groupName="默认题类2";
	numBlock=2;
	fileWrite=file_text_open_write(working_directory+DIRECTORY_GROUP+groupName+".txt");
	file_text_write_real(fileWrite,numBlock); file_text_writeln(fileWrite);
	
	file_text_write_string(fileWrite,"默认题干 2.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项A 2.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项B 2.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项C 2.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项D 2.1"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"A"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认图片资源.png"); file_text_writeln(fileWrite);
	
	file_text_write_string(fileWrite,"默认题干 2.2"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项A 2.2"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项B 2.2"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项C 2.2"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"默认选项D 2.2"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"A"); file_text_writeln(fileWrite);
	file_text_write_string(fileWrite,"无资源"); file_text_writeln(fileWrite);
	
	file_text_close(fileWrite);
}

if(directory_exists(working_directory+DIRECTORY_RESOURCE)){
	directory_destroy(working_directory+DIRECTORY_RESOURCE);
	directory_create(working_directory+DIRECTORY_RESOURCE);
	
	if(file_exists(working_directory+"默认图片资源.png"))
		file_copy(working_directory+"默认图片资源.png",working_directory+DIRECTORY_RESOURCE+"默认图片资源.png");
}

loadGroups();



