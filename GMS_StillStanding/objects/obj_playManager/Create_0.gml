/// @description Insert description here
// You can write your code in this editor

enum PlayState{
	INIT_PLAY,
	INIT_BLOCK,	
	WAIT_SOUND_FIRST_TIME_PLAY,
	WAIT_SELECT_OPTION,
	JUDGE_SELECT_OPTION,
	WAIT_JUDGE_ANIMATION,
	WAIT_MATCH_END_ANIMATION,
	WAIT_SWITCH_TEAM_ANIMATION,
	SHOW_RESULT,
}




ROOM_FONT=global.font_CN_play;



//actully not need,use as define 
curTeamIndex=-1;
ins_match=noone;//bind with matchManager.ins_match at INIT_PLAY as a speedy reference
resultText=noone;
intervalTime=-1;
selectedOptionIndex=-1;
timer_frameCounter=-1;
isGameTimeGoes=false;