///@argument0 file

var filePath=argument0;

var ans;

var fileRead=file_text_open_read(filePath);
if(fileRead==-1){
	show_message("fileRead error");
	return noone;
}

var numBlock;
numBlock=file_text_read_real(fileRead);

file_text_close(fileRead);
return numBlock;