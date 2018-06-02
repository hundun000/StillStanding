/// @description Insert description here
// You can write your code in this editor
draw_self();

var x_draw=x;
draw_set_font(font);

	


if(manager.curTeamIndex==index){
	draw_sprite(spr_curTeamSign,0,x_draw-55,y);
	draw_set_color(c_white);
}
else
	draw_set_color(c_black);
	
draw_text(x_draw,y,text);	