/// @description Insert description here
// You can write your code in this editor
var x_speed=bulletSpeed*dcos(speedAngle);
var y_speed=bulletSpeed*dsin(speedAngle);

x_bulletSelf-=x_speed;
y_bulletSelf-=y_speed;

if(x_bulletSelf<x_bulletTarget){
	instance_destroy(id);
	var isCorrect=roomManager.selectedOptionIndex==castOptionToIndex(global.blockManager.ins_curBlock.rightAnswer);
	var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
	if(!isCorrect)
		ins_msg.sprite_index=spr_blockContinue;	
	ins_msg.nextState=PlayState.JUDGE_SELECT_OPTION;
	roomManager.intervalTime=PLAY_INTERVAL_TIME;	
}