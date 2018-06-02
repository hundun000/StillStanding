/// @description Insert description here
// You can write your code in this editor
draw_set_font(font);
draw_set_color(color);

var y_offset=(sprite_height)/2-string_height(text)/2;
var x_draw=x+40;
var y_draw=y+y_offset;
draw_self();


	
draw_text(x_draw,y_draw,text);