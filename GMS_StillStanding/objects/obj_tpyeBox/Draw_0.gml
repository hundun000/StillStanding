/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(global.font_CN_typeBox);
if(isSelected)
	draw_set_color(c_orange);
else
	draw_set_color(c_black);
	
draw_text(x,y,">"+text);