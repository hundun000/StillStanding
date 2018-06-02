/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(roomManager.ROOM_FONT);
var x_space=290;
var y_space=110;
var x_start=x+70;
var y_start=y+190;

//var x_draw=x+10;
//var y_draw=y+10;


/*	
*	name	sum	
*	corret	wrong
*/
var ins_team=ds_list_find_value(roomManager.ins_match.teams,roomManager.curTeamIndex);
draw_set_color(c_white);
draw_text(x_start,y_start+0*y_space,RESULT_TEXTS[0]);
draw_text(x_start,y_start+1*y_space,RESULT_TEXTS[1]);
draw_text(x_start,y_start+2*y_space,RESULT_TEXTS[2]);
draw_set_color(c_black);
draw_text(x_start+x_space,y_start+0*y_space,ins_team.name);
var numCorrect=ds_list_find_value(roomManager.ins_match.numCorrectAnswer,roomManager.curTeamIndex);
draw_text(x_start+x_space,y_start+1*y_space,string(numCorrect));
var numWrong=ds_list_find_value(roomManager.ins_match.numWrongAnswer,roomManager.curTeamIndex);
draw_text(x_start+x_space,y_start+2*y_space,string(numWrong));

var size=ds_list_size(roomManager.ins_match.teams);
draw_text(x+50,y+50,string(roomManager.curTeamIndex+1)+"/"+string(size));




