///@argument0 groupName
///@argument1 targetIndex

var groupName=argument0;
var targetIndex=argument1;
var ans;

var fileRead;
fileRead=file_text_open_read(working_directory+groupName+".txt");
if(fileRead==-1){
	show_message("fileRead error");
	return noone;
}

var numBlock;
numBlock=file_text_read_real(fileRead); file_text_readln(fileRead); 
if(targetIndex>=numBlock||targetIndex<0)	
	return noone;

var i;
for(i=0;i<targetIndex;i++)
	readNextBlock(fileRead,true);

var targetBlock=readNextBlock(fileRead,false);

file_text_close(fileRead);
return targetBlock;


