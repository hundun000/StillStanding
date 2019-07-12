///@argument0 bodyString
var bodyString = argument0;
var bodyMap = json_decode(bodyString);

ins_block = instance_create_depth(0,0,1,obj_block);
	
ins_block.question = bodyMap[?"stem"];
var answerList = bodyMap[?"options"];
ins_block.answer[0] = answerList[|0];
ins_block.answer[1] = answerList[|1];
ins_block.answer[2] = answerList[|2];
ins_block.answer[3] = answerList[|3];
ins_block.rightAnswer = bodyMap[?"answer"];
ins_block.resourcesName = bodyMap[?"stem"];
		
global.blockManager.ins_curBlock = ins_block;
		
//----skill part----
skillType = noone;
isSkillSkip = false;
gainBlockTime = 0;
isShowWrong[0] = false;
isShowWrong[1] = false;
isShowWrong[2] = false;
isShowWrong[3] = false;
		
timer_frameCounter = 0;
selectedOptionIndex = -1;
ds_list_set(ins_match.usedTimes, curTeamIndex, 0);
		
if (getResourceType(ins_block.resourcesName) == ResourceType.SOUND)
	playState = PlayState.WAIT_SOUND_FIRST_TIME_PLAY;
else
	playState = PlayState.WAIT_SELECT_OPTION;
