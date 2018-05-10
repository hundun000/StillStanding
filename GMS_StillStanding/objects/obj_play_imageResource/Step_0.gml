/// @description Insert description here
// You can write your code in this editor
if(dataManager.ins_curBlock!=noone
   &&getResourceType(dataManager.ins_curBlock.resourcesName)==ResourceType.IMAGE){
	if(curResourceName!=dataManager.ins_curBlock.resourcesName){
		curResourceName=dataManager.ins_curBlock.resourcesName;
		sprite_index=spr_imageResource_change;
		image_xscale=1;
		image_yscale=1;
		replaceResourceImage(id,curResourceName);
	}
}
else{
	sprite_index=spr_imageResource_none;
	image_xscale=1;
	image_yscale=1;
	curResourceName=noone;
}