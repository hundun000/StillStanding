/// @description Insert description here
// You can write your code in this editor
#macro PLAY_INTERVAL_TIME 5

enum PlayState{
	INIT_PLAY,
	INIT_SWITCHED_TEAM,
	INIT_BLOCK,	
	WAIT_SOUND_FIRST_TIME_PLAY,
	WAIT_SELECT_OPTION,
	JUDGE_SELECT_OPTION,
	WAIT_JUDGE_ANIMATION,
	WAIT_SCREEN_MESSAGE_ANIMATION,
	WAIT_SWITCH_TEAM_ANIMATION,
	INIT_RESULT_BOARD,
	SHOW_RESULT,
}

#macro SKILL_TIME_GAIN_CALL_HELP_A 60
#macro SKILL_TIME_GAIN_CALL_HELP_B 60
enum SkillType{
	SKILL_SKIP,
	SKILL_SEE_WRONG,
	SKILL_CALL_HELP_A,
	SKILL_CALL_HELP_B
	
}
skillType=noone;
isShowWrong[0]=false;
isShowWrong[1]=false;
isShowWrong[2]=false;
isShowWrong[3]=false;
isSkillSkip=noone;
gainBlockTime=-1;


ROOM_FONT=global.font_CN_play;



//actully not need,use as define 
playState=noone;
curTeamIndex=-1;
switchBlockCounter=-1;

ins_match=noone;//bind with matchManager.ins_match at INIT_PLAY as a speedy reference
resultText=noone;
intervalTime=-1;
selectedOptionIndex=-1;
timer_frameCounter=-1;
isGameTimeGoes=false;