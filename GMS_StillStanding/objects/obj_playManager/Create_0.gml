/// @description Insert description here
// You can write your code in this editor

enum PlayState{
	INIT_PLAY,
	INIT_BLOCK,	
	WAIT_SELECT_OPTION,
	JUDGE_SELECT_OPTION,
	WAIT_MATCH_END_ANIMATION,
	SHOW_RESULT,
}




ROOM_FONT=global.font_CN_play;

playState=PlayState.INIT_PLAY;

//actully not need,use as define 
curTeamIndex=-1;
ins_match=noone;//bind with matchManager.ins_match at INIT_PLAY as a speedy reference

intervalTime=-1;
selectedOptionIndex=-1;
timer_lastTimeSec=-1;