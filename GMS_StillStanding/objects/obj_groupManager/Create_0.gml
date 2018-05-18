/// @description Insert description here
// You can write your code in this editor
enum GroupRoomState{
	SELECTING_GROUP,
	SELECTING_GROUP_OPERATION
}

#macro INDEX_GROUP_SHOW 0
#macro INDEX_GROUP_ADD 1

ROOM_FONT=font_add("ARIALUNI_fixed.ttf",32,0,0,32,128);

selectedOperationIndex=-1;
groupRoomState=noone;
selectedGroupIndex=-1;

groupNames=ds_list_create();
groupNumBlocks=ds_list_create();
groupNumUsedBlocks=ds_list_create();

OPERATION_TEXTS[INDEX_GROUP_SHOW]="查看所有题类";
OPERATION_TEXTS[INDEX_GROUP_ADD]="添加题类";