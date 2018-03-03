///@argument0 fileRead



var fileRead=argument0;
var ans;

var readInString;
readInString=file_text_read_string(fileRead); file_text_readln(fileRead); 
var numBan=file_text_read_real(fileRead); file_text_readln(fileRead); 

ans=instance_create_depth(0,0,1,obj_team);
ans.name=readInString;

var i;
for(i=0;i<numBan;i++){
	var banGroupName=file_text_read_string(fileRead); file_text_readln(fileRead); 
	ds_list_add(ans.banGroupNames,banGroupName);
}

return ans;