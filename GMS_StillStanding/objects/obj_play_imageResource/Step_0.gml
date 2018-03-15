/// @description Insert description here
// You can write your code in this editor
if(dataManager.ins_curBlock!=noone&&dataManager.ins_curBlock.resourcesName!=STRING_NO_RESOURCE){
	if(curResourceName!=dataManager.ins_curBlock.resourcesName){
		curResourceName=dataManager.ins_curBlock.resourcesName;
		replaceResourceImage(id,curResourceName);
	}
}
else{
	image_index=spr_imageResource;
	curResourceName=noone;
}