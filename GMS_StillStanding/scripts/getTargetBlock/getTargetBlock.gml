///@argument0 groupName
///@argument1 targetIndex

var groupName=argument0;
var targetIndex=argument1;
var ans;

var fileRead;
fileRead=file_text_open_read(working_directory+DIRECTORY_GROUP+groupName+".txt");
if(fileRead==-1){
	show_message("fileRead error");
	return noone;
}


file_text_readln(fileRead); //skip num block line
file_text_readln(fileRead); //blank

var i;
for(i=0;i<targetIndex;i++)
	readNextBlock(fileRead,true);

var targetBlock=readNextBlock(fileRead,false);
targetBlock.groupName=groupName;
targetBlock.indexInGroup=targetIndex;


file_text_close(fileRead);
return targetBlock;


