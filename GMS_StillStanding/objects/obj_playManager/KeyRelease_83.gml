/// @description Insert description here
// You can write your code in this editor
//var ins_team=ds_list_find_value(ins_match.teams,curTeamIndex);
				//if(ins_team.numSkillChance[INDEX_SKILL_SKIP]>0){
					//ins_team.numSkillChance[INDEX_SKILL_SKIP]--;
if(playState==PlayState.WAIT_SELECT_OPTION||playState==PlayState.WAIT_SOUND_FIRST_TIME_PLAY){					
					intervalTime=PLAY_INTERVAL_TIME;
					isSkillSkip=true;
					
					skillType=noone;
					
					addLog(LogType.PLAY_LOG,"管理员跳过");
					
					if(isSkillAnimation){
							var ins_msg=instance_create_depth(0,0,-1,obj_play_screenMessage);
							ins_msg.sprite_index=spr_skillSkip;
							ins_msg.nextState=PlayState.JUDGE_SELECT_OPTION;
							playState=PlayState.WAIT_SCREEN_MESSAGE_ANIMATION;
						}else{
							playState=PlayState.JUDGE_SELECT_OPTION;
						}
}
				//}
				//break;