var code=argument0;

var size=ds_list_size(global.groupManager.groupNames);
for(var i=0;i<size;i++){
	var numBlock=ds_list_find_value(global.groupManager.groupNumBlocks,i);
	if(code-numBlock>=0)
		code-=numBlock;
	else
		return i;
}

return -1;
