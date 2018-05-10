/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.PLAY_MANAGER) return;


var flag_secondPass;
if(timer_frameCounter++==GAME_FPS){
	timer_frameCounter=0;
	flag_secondPass=true;
}
else{
	flag_secondPass=false;
}


isGameTimeGoes=false;//only some in state,game time goes ,set false as default
switch(playState){
	case PlayState.INIT_PLAY:
		curTeamIndex=0;
		ins_match=global.thisGame.matchManager.ins_match;
		
		var size=ds_list_size(ins_match.teams);
		var ins_first=instance_find(obj_play_teamInfo,0);//use the first instance to locate
		var originX=ins_first.x;
		var originY=ins_first.y;
		var space=ins_first.sprite_height+5;
		var i;
		for(i=1;i<size;i++){
			var newIns=instance_create_depth(originX,originY+i*space,ins_first.depth,obj_play_teamInfo);
			newIns.image_xscale=ins_first.image_xscale;
			newIns.image_yscale=ins_first.image_yscale;
			newIns.index=i;
		}
		
		playState=PlayState.INIT_BLOCK;
		break;
		
	case PlayState.INIT_BLOCK:
		var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
		
		var numBanGroup=ds_list_size(ins_curTeam.banGroupNames);
		var numAllGroup=ds_list_size(global.groupManager.groupNames);

		var deadLoopWatchDog=0;

		var isBan=true;//into first loop
		var isUseOut=true;
		var targetGroupIndex;
		var targetGroupName;
		var numUsed;
		randomise();
		while(isBan||isUseOut){
			targetGroupIndex=irandom(numAllGroup-1);
			targetGroupName=ds_list_find_value(global.groupManager.groupNames,targetGroupIndex);
			numUsed=ds_list_find_value(global.groupManager.groupNumUsedBlocks,targetGroupIndex);
			
			isBan=(ds_list_find_index(ins_curTeam.banGroupNames,targetGroupName)!=-1);
			isUseOut=(numUsed==ds_list_find_value(global.groupManager.groupNumBlocks,targetGroupIndex));
						
			if(deadLoopWatchDog++>100000){
				show_message("watchDog!");
				clearAllUsedBlock();
			}
		}
		
		ds_list_replace(global.groupManager.groupNumUsedBlocks,targetGroupIndex,numUsed+1);
		var numBlock=ds_list_find_value(global.groupManager.groupNumBlocks,targetGroupIndex);
		
		var isUsed=true;//into first loop
		var code;
		var targetBlockIndex;
		var ins_block;
		while(isUsed){
			targetBlockIndex=irandom(numBlock-1);
			
			code=targetGroupName+string(targetBlockIndex);
			isUsed=(ds_list_find_index(global.blockManager.usedBlockCodes,code)!=-1);		
			
			if(deadLoopWatchDog++>100000){
				show_message("watchDog!");
				clearAllUsedBlock();
			}
		}
		ins_block=getTargetBlock(targetGroupName,targetBlockIndex);
		
		ds_list_add(global.blockManager.usedBlockCodes,code);
		global.blockManager.ins_curBlock=ins_block;
		
		timer_frameCounter=0;
		selectedOptionIndex=-1;
		if(ins_match.isTimeResetEveryBlock)
			ds_list_set(ins_match.usedTime,curTeamIndex,0);
		
		if(getResourceType(ins_block.resourcesName)==ResourceType.SOUND)
			playState=PlayState.WAIT_SOUND_FIRST_TIME_PLAY;
		else
			playState=PlayState.WAIT_SELECT_OPTION;
		break;
		
	case PlayState.WAIT_SOUND_FIRST_TIME_PLAY:
		//obj_sound will change from this state
		break;
	case PlayState.WAIT_SELECT_OPTION:
		isGameTimeGoes=true;
		if(selectedOptionIndex!=-1){	
						
			playState=PlayState.WAIT_JUDGE_ANIMATION;
			
			var ins_choiceBullet=instance_create_depth(0,0,-100,obj_choiceBullet);
			var ins_target=instance_find(obj_play_questionBox,0);
			ins_choiceBullet.x_bulletTarget=ins_target.x;
			ins_choiceBullet.y_bulletTarget=ins_target.y;
			var tanSpeed=(ins_choiceBullet.y_bulletSelf-ins_choiceBullet.y_bulletTarget)/(ins_choiceBullet.y_bulletSelf-ins_choiceBullet.y_bulletTarget);
			ins_choiceBullet.speedAngle=darctan(tanSpeed);
			ins_choiceBullet.bulletText=global.blockManager.ins_curBlock.answer[selectedOptionIndex];
		}
		break;
	case PlayState.WAIT_JUDGE_ANIMATION:	
		//obj_animation will change from this state
		break;		
	case PlayState.JUDGE_SELECT_OPTION:	
		if(intervalTime==0){
			
			var numCorrectAnswer=ds_list_find_value(ins_match.numCorrectAnswer,curTeamIndex);
			var numWrongAnswer=ds_list_find_value(ins_match.numWrongAnswer,curTeamIndex);
			var isCorrect=selectedOptionIndex==castOptionToIndex(global.blockManager.ins_curBlock.rightAnswer);
			if(isCorrect){
				ds_list_replace(ins_match.numCorrectAnswer,curTeamIndex,++numCorrectAnswer);
			}
			else{
				ds_list_replace(ins_match.numWrongAnswer,curTeamIndex,++numWrongAnswer);		
			}
			
			if(numCorrectAnswer+numWrongAnswer==ins_match.blockLimit){
				var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
				resultText=ins_curTeam.name+" have answered limit-sum blocks.";
				instance_destroy(global.blockManager.ins_curBlock);
				global.blockManager.ins_curBlock=noone;
				var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
				ins_msg.sprite_index=spr_matchEnd;
				ins_msg.nextState=PlayState.SHOW_RESULT;
				playState=PlayState.WAIT_MATCH_END_ANIMATION;
				return;
			}
			
			if(numWrongAnswer==ins_match.wrongLimit){
				var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
				resultText=ins_curTeam.name+" have answered limit-wrong blocks.";
				instance_destroy(global.blockManager.ins_curBlock);
				global.blockManager.ins_curBlock=noone;
				var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
				ins_msg.sprite_index=spr_matchEnd;
				ins_msg.nextState=PlayState.SHOW_RESULT;
				playState=PlayState.WAIT_MATCH_END_ANIMATION;
				return;
			}
			
			playState=PlayState.INIT_BLOCK;
		}
		break;
		



	case PlayState.WAIT_MATCH_END_ANIMATION:	
		//obj_animation will change from this state
		break;
	
	case PlayState.SHOW_RESULT:
		if(isA){
			
			var size=ds_list_size(ins_match.teams);
			var i;
			for(i=0;i<size;i++){
				var ins_team=ds_list_find_value(ins_match.teams,i);
				ins_team.numMatch++;
				ins_team.sumCorrectAnswer+=ds_list_find_value(ins_match.numCorrectAnswer,i);
				ins_team.sumWrongAnswer+=ds_list_find_value(ins_match.numWrongAnswer,i);
			}
			instance_destroy(ins_match);
			ins_match=noone;
			room_goto(room_mainMenu);
		}
		break;
	case PlayState.WAIT_SWITCH_TEAM_ANIMATION:
		//obj_animation will change from this state
		break;
}



if(flag_secondPass){
	if(intervalTime!=0)
		intervalTime--;
	if(isGameTimeGoes){
		var usedTime=ds_list_find_value(ins_match.usedTime,curTeamIndex);
		usedTime++;
		ds_list_replace(ins_match.usedTime,curTeamIndex,usedTime);
		
		if(usedTime==ins_match.timeLimit){
			var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
			var numCurrentCorrectAnswer=ds_list_find_value(ins_match.numCorrectAnswer,curTeamIndex);
			resultText=ins_curTeam.name+" uses out time.";	
			instance_destroy(global.blockManager.ins_curBlock);
			global.blockManager.ins_curBlock=noone;
			instance_create_depth(0,0,-1,obj_play_matchEnd);
			playState=PlayState.WAIT_MATCH_END_ANIMATION;
		}
		
	}
}
