var groupsList=global.groupManager.groupNames;
var ansList=global.groupManager.pickableGroupNames;


var size=ds_list_size(groupsList);
var numPickable=min(global.thisGame.config_NUM_GROUP_PICKABLE,size);

var tempList=ds_list_create();
ds_list_copy(tempList,groupsList);
ds_list_shuffle(tempList);
ds_list_clear(ansList);
for(var i=0;i<numPickable;i++){
	var pickedName=ds_list_find_value(tempList,i);
	ds_list_add(ansList,pickedName);
}