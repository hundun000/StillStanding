/// @description Insert description here
// You can write your code in this editor
enum GroupRoomState{
	SELECTING_GROUP,
	SELECTING_GROUP_OPERATION
}



ROOM_FONT=font_add("ARIALUNI_fixed.ttf",25,0,0,32,128);

selectedOperationIndex=-1;
groupRoomState=noone;
selectedGroupIndex=-1;
selectedGroupPage=-1;
PAGE_SIZE=6;

groupNames=ds_list_create();
groupNumBlocks=ds_list_create();
groupNumUsedBlocks=ds_list_create();
groupNumBlocksSum=0;

pickableGroupNames=ds_list_create();
banableGroupNames=ds_list_create();

#macro INDEX_GROUP_SHOW 0
#macro INDEX_GROUP_ADD 1
#macro INDEX_GROUP_RESET 2

OPERATION_TEXTS[INDEX_GROUP_SHOW]="查看所有题类";
//OPERATION_TEXTS[INDEX_GROUP_ADD]="[暂无功能]";
//OPERATION_TEXTS[INDEX_GROUP_RESET]="[暂无功能]";