///@argument0 ins_match
///@argument1 matchType
var ins_match=argument0;
var matchType=argument1;

ins_match.matchType=matchType;
switch(matchType){
	case MatchType.SINGLE_MATCH:
		ins_match.timeLimit=-1;
		ins_match.blockLimit=SINGLE_MATCH_BLOCK_LIMIT;
		ins_match.isTimeResetEveryBlock=false;
		ins_match.wrongLimit=-1;
		break;
	case MatchType.POLLING_MATCH:
		ins_match.timeLimit=POLLING_MATCH_TIME_LIMIT;
		ins_match.blockLimit=-1;
		ins_match.isTimeResetEveryBlock=true;
		ins_match.wrongLimit=1;
		break;		
	
	
}