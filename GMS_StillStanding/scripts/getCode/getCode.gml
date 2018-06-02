var groupIndex=argument0;
var blockIndex=argument1;

var code=0;
for(var i=0;i<groupIndex;i++){
	var numBlock=ds_list_find_value(global.groupManager.groupNumBlocks,i);
	code+=numBlock;
}
code+=blockIndex;

return code;