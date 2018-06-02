/// @description Insert description here
// You can write your code in this editor
#macro isRollByNumBlck true
#macro isBulletAnimation false
#macro isSkillAnimation false

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
		ins_match=global.thisGame.matchManager.ins_match;
		var size=ds_list_size(ins_match.teams);
		curTeamIndex=size-1;//when into next state,index++(set to 0)
		
		var ins_first=instance_find(obj_play_teamInfo,0);//use the first instance to locate
		var originX=ins_first.x;
		var originY=ins_first.y;
		var space=ins_first.sprite_height+5;
		var i;
		for(i=0;i<size;i++){
			if(i>0){
				var newIns=instance_create_depth(originX,originY+i*space,ins_first.depth,obj_play_teamInfo);
				newIns.image_xscale=ins_first.image_xscale;
				newIns.image_yscale=ins_first.image_yscale;
				newIns.index=i;
			}
			var ins_team=ds_list_find_value(ins_match.teams,i);
			ins_team.numPickChance=global.thisGame.config_FULL_PICK_CHANCE;
			if(ins_match.teamNumLimit==1){
				ins_team.numSkillChance[INDEX_SKILL_SKIP]=0;
				ins_team.numSkillChance[INDEX_SKILL_SEE_WRONG]=0;
				ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_MILK]=0;
				ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_VIEWER]=0;
			}
			else{
				ins_team.numSkillChance[INDEX_SKILL_SKIP]=1;
				ins_team.numSkillChance[INDEX_SKILL_SEE_WRONG]=1;
				ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_MILK]=1;
				ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_VIEWER]=1;
			}
		}
		
		
		
		
		playState=PlayState.INIT_SWITCHED_TEAM;
		break;
		
	case PlayState.INIT_SWITCHED_TEAM:
		var size=ds_list_size(ins_match.teams);
		curTeamIndex=(curTeamIndex+1) mod size;
		switchBlockCounter=0;
		playState=PlayState.INIT_BLOCK;
		addLog(LogType.PLAY_LOG,"当前队伍index变为:"+string(curTeamIndex));
		break;
		
	case PlayState.INIT_BLOCK:
		var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
		
		var numBanGroup=ds_list_size(ins_curTeam.banGroupNames);
		var numPickGroup=ds_list_size(ins_curTeam.pickGroupNames);
		var numAllGroup=ds_list_size(global.groupManager.groupNames);

		var deadLoopWatchDog=0;

		var isBan=true;//into first loop
		var isUseOut=true;
		var targetGroupIndex;
		var targetGroupName;
		var numUsed;
		var numBlock;
		
		var pickingGroupIndex;
		var pickingGroupName;
		var isPickSucceed;

		
		//-------try pick------
		isPickSucceed=false;//default
		if(numPickGroup>0){
			isBan=true;//into first loop
			isUseOut=true;
			if(ins_curTeam.numPickChance>0){
				
				while(ins_curTeam.numPickChance>0&&isUseOut){
					ins_curTeam.numPickChance--;
					pickingGroupIndex=irandom(numPickGroup-1);	
					pickingGroupName=ds_list_find_value(ins_curTeam.pickGroupNames,pickingGroupIndex);
					
					targetGroupIndex=ds_list_find_index(global.groupManager.groupNames,pickingGroupName);
					targetGroupName=pickingGroupName;
					numUsed=ds_list_find_value(global.groupManager.groupNumUsedBlocks,targetGroupIndex);
					numBlock=ds_list_find_value(global.groupManager.groupNumBlocks,targetGroupIndex);
					isUseOut=(numUsed==numBlock);
									
					if(isUseOut)
						addLog(LogType.PLAY_LOG,"尝试pick:"+pickingGroupName+",但本组题类已用尽"+",剩余机会:"+string(ins_curTeam.numPickChance));
				
					if(deadLoopWatchDog++>100000){
						show_message("deadlock watchDog!");
						clearAllUsedBlock();
					}
				}
				/* here state for (num>0,isUsedOut) can be 
				*	(T,F): succesed 
				*   (F,F): succesed and used the last chance
				*	(F,T): pick chance use out and pick fail
				*	as (T,T) will while-looping 
				*/
				isPickSucceed=!isUseOut;	
				
				if(isPickSucceed){
					addLog(LogType.PLAY_LOG,"成功pick:"+pickingGroupName+",剩余机会:"+string(ins_curTeam.numPickChance));
				}
				else
					addLog(LogType.PLAY_LOG,"未成功pick且用尽pick机会");
			}	
		}
		
		//-------try roll group------
		var randomCode;
		if(!isPickSucceed){	

			while(isBan||isUseOut){
				if(isRollByNumBlck){
					randomCode=irandom(global.groupManager.groupNumBlocksSum-1);
					targetGroupIndex=getGroupIndexByCode(randomCode);
					addLog(LogType.PLAY_LOG,"随机选题代码为:"+string(randomCode));
				}
				else
					targetGroupIndex=irandom(numAllGroup-1);
						
				targetGroupName=ds_list_find_value(global.groupManager.groupNames,targetGroupIndex);
				numUsed=ds_list_find_value(global.groupManager.groupNumUsedBlocks,targetGroupIndex);
				numBlock=ds_list_find_value(global.groupManager.groupNumBlocks,targetGroupIndex);
				isBan=(ds_list_find_index(ins_curTeam.banGroupNames,targetGroupName)!=-1);
				isUseOut=(numUsed==numBlock);
				
				if(isBan)
					addLog(LogType.PLAY_LOG,"尝试选中:"+targetGroupName+",但本组题类被ban");
				else if(isUseOut)
					addLog(LogType.PLAY_LOG,"尝试选中:"+targetGroupName+",但本组题类已用尽");	
					
				if(deadLoopWatchDog++>100000){
					show_message("deadlock watchDog!");
					clearAllUsedBlock();
					deadLoopWatchDog=0;
				}
				
				
			}
			addLog(LogType.PLAY_LOG,"成功选中:"+targetGroupName);

		}
		//------ group determined --------
		ds_list_replace(global.groupManager.groupNumUsedBlocks,targetGroupIndex,numUsed+1);
		
		//------ try roll block ----------

		var isUsed=true;//into first loop
		var code;
		var targetBlockIndex;
		var ins_block;
		while(isUsed){
				

			targetBlockIndex=irandom(numBlock-1);
			code=getCode(targetGroupIndex,targetBlockIndex);

			
			isUsed=(ds_list_find_index(global.blockManager.usedBlockCodes,code)!=-1);		
			
			if(isUsed)
				addLog(LogType.PLAY_LOG,"尝试选中第"+string(targetBlockIndex)+"题,但本题已用过");	
			
			if(deadLoopWatchDog++>100000){
				show_message("deadlock watchDog!");
				clearAllUsedBlock();
				deadLoopWatchDog=0;
			}
		}
		addLog(LogType.PLAY_LOG,"成功选中第"+string(targetBlockIndex)+"题");
		
		ins_block=getTargetBlock(targetGroupName,targetBlockIndex);
		ds_list_add(global.blockManager.usedBlockCodes,code);
		global.blockManager.ins_curBlock=ins_block;
		
		//----skill part----
		skillType=noone;
		isSkillSkip=false;
		gainBlockTime=0;
		isShowWrong[0]=false;
		isShowWrong[1]=false;
		isShowWrong[2]=false;
		isShowWrong[3]=false;
		
		timer_frameCounter=0;
		selectedOptionIndex=-1;
		ds_list_set(ins_match.usedTimes,curTeamIndex,0);
		
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
						
			
			
			if(isBulletAnimation){
				var ins_choiceBullet=instance_create_depth(0,0,-100,obj_choiceBullet);
				var ins_target=instance_find(obj_play_questionBox,0);
				ins_choiceBullet.x_bulletTarget=ins_target.x+ins_target.sprite_width/2;
				ins_choiceBullet.y_bulletTarget=ins_target.y+ins_target.sprite_height/2;
				var tanSpeed=(ins_choiceBullet.y_bulletSelf-ins_choiceBullet.y_bulletTarget)/(ins_choiceBullet.x_bulletSelf-ins_choiceBullet.x_bulletTarget);
				ins_choiceBullet.speedAngle=darctan(tanSpeed);
				ins_choiceBullet.bulletText=global.blockManager.ins_curBlock.answer[selectedOptionIndex];
				playState=PlayState.WAIT_JUDGE_ANIMATION;
			}
			else{
				var isCorrect=selectedOptionIndex==castOptionToIndex(global.blockManager.ins_curBlock.rightAnswer);
				var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
				if(isCorrect)
					ins_msg.sprite_index=spr_blockBreak;
				else
					ins_msg.sprite_index=spr_blockContinue;	
					
				ins_msg.nextState=PlayState.JUDGE_SELECT_OPTION;
				intervalTime=PLAY_INTERVAL_TIME;
				playState=PlayState.WAIT_JUDGE_ANIMATION;
				
			}
		}
		
		switch(skillType){
			case noone:
				break;
			case SkillType.SKILL_SKIP:
				var ins_team=ds_list_find_value(ins_match.teams,curTeamIndex);
				if(ins_team.numSkillChance[INDEX_SKILL_SKIP]>0){
					ins_team.numSkillChance[INDEX_SKILL_SKIP]--;
					
					intervalTime=PLAY_INTERVAL_TIME;
					isSkillSkip=true;
					
					skillType=noone;
					
					addLog(LogType.PLAY_LOG,"使用了技能：跳过");
					
					if(isSkillAnimation){
						var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
						ins_msg.sprite_index=spr_skillSkip;
						ins_msg.nextState=PlayState.JUDGE_SELECT_OPTION;
						playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
					}
					else{
						playState=PlayState.JUDGE_SELECT_OPTION;
					}
				}
				break;
			case SkillType.SKILL_SEE_WRONG:
				//if(!(isShowWrong[0]||isShowWrong[1]||isShowWrong[2]||isShowWrong[3])){
					var ins_team=ds_list_find_value(ins_match.teams,curTeamIndex);
					if(ins_team.numSkillChance[INDEX_SKILL_SEE_WRONG]>0){
						ins_team.numSkillChance[INDEX_SKILL_SEE_WRONG]--;

						
					
						//ensure notShowIndex!=answer
						var offset=irandom_range(1,3);
						var notShowIndex=(castOptionToIndex(global.blockManager.ins_curBlock.rightAnswer)+offset) mod 4;
						
						for(var i=0;i<4;i++){
							isShowWrong[i]=(i!=notShowIndex&&i!=castOptionToIndex(global.blockManager.ins_curBlock.rightAnswer));		
						}
						
						skillType=noone;
						
						addLog(LogType.PLAY_LOG,"使用了技能：排除选项");
						
						if(isSkillAnimation){
							var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
							ins_msg.sprite_index=spr_skillSeeWrong;
							ins_msg.nextState=PlayState.WAIT_SELECT_OPTION;
							playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
						}
					}
				//}
				break;
			case SkillType.SKILL_CALL_HELP_A:
				//if(gainBlockTime==0){
					var ins_team=ds_list_find_value(ins_match.teams,curTeamIndex);
					if(ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_MILK]>0){
						ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_MILK]--;
						
						gainBlockTime+=SKILL_TIME_GAIN_CALL_HELP_A;			
						skillType=noone;
						addLog(LogType.PLAY_LOG,"使用了技能：A类求助");
						
						if(isSkillAnimation){
							var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
							ins_msg.sprite_index=spr_skillHelpA;
							ins_msg.nextState=PlayState.WAIT_SELECT_OPTION;
							playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
						}
					}
				//}
				break;
			case SkillType.SKILL_CALL_HELP_B:
				//if(gainBlockTime==0){
					var ins_team=ds_list_find_value(ins_match.teams,curTeamIndex);
					if(ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_VIEWER]>0){
						ins_team.numSkillChance[INDEX_SKILL_CALL_HELP_VIEWER]--;
						
						gainBlockTime+=SKILL_TIME_GAIN_CALL_HELP_B;
						
						skillType=noone;
						addLog(LogType.PLAY_LOG,"使用了技能：B类求助");
						
						if(isSkillAnimation){
							var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
							ins_msg.sprite_index=spr_skillHelpB;
							ins_msg.nextState=PlayState.WAIT_SELECT_OPTION;
							playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
						}
					}
				//}
				break;	
		}
			
	case PlayState.WAIT_JUDGE_ANIMATION:	
		//obj_animation will change from this state
		break;		
	case PlayState.JUDGE_SELECT_OPTION:	
		if(intervalTime==0){
			
			var numCorrectAnswer=ds_list_find_value(ins_match.numCorrectAnswer,curTeamIndex);
			var numWrongAnswer=ds_list_find_value(ins_match.numWrongAnswer,curTeamIndex);
			
			if(!isSkillSkip){
				var isCorrect=selectedOptionIndex==castOptionToIndex(global.blockManager.ins_curBlock.rightAnswer);
				if(isCorrect){
					ds_list_replace(ins_match.numCorrectAnswer,curTeamIndex,++numCorrectAnswer);
				}
				else{
					ds_list_replace(ins_match.numWrongAnswer,curTeamIndex,++numWrongAnswer);		
				}			
			}
			switchBlockCounter++;
			
			instance_destroy(global.blockManager.ins_curBlock);
			global.blockManager.ins_curBlock=noone;
			
			if(numCorrectAnswer+numWrongAnswer==ins_match.matchBlockNumLimit){
				var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
				resultTexts=ins_curTeam.name+"达到了总题数限制\n";		
				var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
				ins_msg.sprite_index=spr_matchEnd;
				ins_msg.nextState=PlayState.INIT_RESULT_BOARD;
				playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
				return;
			}
			
			if(numWrongAnswer==ins_match.matchWrongLimit){
				var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
				resultTexts=ins_curTeam.name+"达到了答错题数限制\n";
				var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
				ins_msg.sprite_index=spr_matchEnd;
				ins_msg.nextState=PlayState.INIT_RESULT_BOARD;
				playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
				return;
			}
			
			if(switchBlockCounter==ins_match.switchBlockNumLimit){
				var ins_curTeam=ds_list_find_value(ins_match.teams,curTeamIndex);
				var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
				ins_msg.sprite_index=spr_switchTeam;
				ins_msg.nextState=PlayState.INIT_SWITCHED_TEAM;
				playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
				

				return;
			}
			
			playState=PlayState.INIT_BLOCK;
		}
		break;
		



	case PlayState.WAIT_SCREEN_MESSAGE_ANIMATION:	
		//obj_animation will change from this state
		break;
	case PlayState.INIT_RESULT_BOARD:	
		instance_create_depth(0,0,-1,obj_play_resultBoard);
		//resultTexts+="各队得分情况：\n";
		var size=ds_list_size(ins_match.teams);
		/*
		var i;
		for(i=0;i<size;i++){
			var ins_team=ds_list_find_value(ins_match.teams,i);
			//resultTexts+=ins_team.name+"队\n";
			//resultTexts+="答对"+string(ds_list_find_value(ins_match.numCorrectAnswer,i))+"题；";
			//resultTexts+="答错"+string(ds_list_find_value(ins_match.numWrongAnswer,i))+"题\n";
			//resultTexts[i+INDEX_RESULT_NAME*2]=ins_team.name+"队";
			//resultTexts[i+INDEX_RESULT_CORRECT*2]=string(ds_list_find_value(ins_match.numCorrectAnswer,i));
			//resultTexts[i+INDEX_RESULT_WRONG*2]=string(ds_list_find_value(ins_match.numWrongAnswer,i));			
				ins_team.numMatch++;
				ins_team.sumCorrectAnswer+=ds_list_find_value(ins_match.numCorrectAnswer,i);
				ins_team.sumWrongAnswer+=ds_list_find_value(ins_match.numWrongAnswer,i);
		}
		*/
		//resultTexts+="按A键返回主菜单\n";
		playState=PlayState.SHOW_RESULT;
		curTeamIndex=0;//for show result
		break;	
	case PlayState.SHOW_RESULT:
		if(isA){
			if(curTeamIndex==ds_list_size(ins_match.teams)-1){//resoult board in last page
				instance_destroy(ins_match);
				ins_match=noone;
				playState=noone;
				room_goto(room_mainMenu);
			}
			
		}
		else if(input_dx!=0){
			var size=ds_list_size(ins_match.teams);	
			curTeamIndex=clamp(curTeamIndex+input_dx,0,size-1);	
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
		var usedTimes=ds_list_find_value(ins_match.usedTimes,curTeamIndex);
		usedTimes++;
		ds_list_replace(ins_match.usedTimes,curTeamIndex,usedTimes);
		
		if(usedTimes==ins_match.blockTimeLimit+gainBlockTime){
			var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
			ins_msg.sprite_index=spr_skillTimeOut;
			ins_msg.nextState=PlayState.JUDGE_SELECT_OPTION;
					
			intervalTime=PLAY_INTERVAL_TIME;
			playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
		}
	}
}
