/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(roomManager.playState==PlayState.JUDGE_SELECT_OPTION){
	var subimage;
	if(index==castOptionToIndex(dataManager.ins_curBlock.rightAnswer))
		subimage=0;
	else
		subimage=1;	
	
	draw_sprite(spr_judge,subimage,x-64,y);
}

