///@argument0 fileRead
///@argument1 isBlank

#macro INDEX_QUESTION 1
#macro INDEX_ANSWER_A 2
#macro INDEX_ANSWER_B 3
#macro INDEX_ANSWER_C 4
#macro INDEX_ANSWER_D 5
#macro INDEX_RIGHT_ANSWER 6
#macro INDEX_RESOURCE_NAME 7

var fileRead=argument0;
var isBlank=argument1;
var ans;

var readInString;
readInString[INDEX_QUESTION]=file_text_read_string(fileRead); file_text_readln(fileRead); 
readInString[INDEX_ANSWER_A]=file_text_read_string(fileRead); file_text_readln(fileRead); 
readInString[INDEX_ANSWER_B]=file_text_read_string(fileRead); file_text_readln(fileRead); 
readInString[INDEX_ANSWER_C]=file_text_read_string(fileRead); file_text_readln(fileRead); 
readInString[INDEX_ANSWER_D]=file_text_read_string(fileRead); file_text_readln(fileRead); 
readInString[INDEX_RIGHT_ANSWER]=file_text_read_string(fileRead); file_text_readln(fileRead); 
readInString[INDEX_RESOURCE_NAME]=file_text_read_string(fileRead); file_text_readln(fileRead); 

if(isBlank)
	ans=noone;
else{
	ans=instance_create_depth(0,0,1,obj_Block);
	
	ans.question=readInString[INDEX_QUESTION];
	ans.answerA=readInString[INDEX_ANSWER_A];
	ans.answerB=readInString[INDEX_ANSWER_A];
	ans.answerC=readInString[INDEX_ANSWER_A];
	ans.answerD=readInString[INDEX_ANSWER_A];
	ans.rightAnswer=readInString[INDEX_RIGHT_ANSWER];
	ans.resourcesName=readInString[INDEX_RESOURCE_NAME];
}

return ans;