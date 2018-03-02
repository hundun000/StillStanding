/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.font_CN_typeBox);
draw_set_color(c_black);

var i=0;
var space=20;
draw_text(x,y+(i++)*space,question);
draw_text(x,y+(i++)*space,answerA);
draw_text(x,y+(i++)*space,answerB);
draw_text(x,y+(i++)*space,answerC);
draw_text(x,y+(i++)*space,answerD);
draw_text(x,y+(i++)*space,rightAnswer);
draw_text(x,y+(i++)*space,resourcesName);