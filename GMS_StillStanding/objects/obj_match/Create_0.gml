/// @description Insert description here
// You can write your code in this editor

enum MatchType{
	SINGLE_MATCH,POLLING_MATCH
}

enum MatchState{
	HANDLE_TIMEOUT,	
}

//#macro SINGLE_MATCH_TIME_LIMIT -1
#macro SINGLE_MATCH_BLOCK_LIMIT 5
#macro POLLING_MATCH_TIME_LIMIT 20
//#macro POLIING_MATCH_BLOCK_LIMIT 5

matchType=noone;
matchState=noone;

teams=ds_list_create();
usedTime=ds_list_create();
numCorrectAnswer=ds_list_create();
numWrongAnswer=ds_list_create();



timeLimit=-1;
blockLimit=-1;
isTimeResetEveryBlock=false;
wrongLimit=-1;