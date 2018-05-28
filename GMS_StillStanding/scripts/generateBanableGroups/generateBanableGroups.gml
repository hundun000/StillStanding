var groupsList=global.groupManager.groupNames;
var ansList=global.groupManager.banableGroupNames;


var size=ds_list_size(groupsList);

ds_list_clear(ansList);
for(var i=0;i<size;i++){
	var groupName=ds_list_find_value(groupsList,i);
	if(string_pos("动画_",groupName)==0)
		ds_list_add(ansList,groupName);
}