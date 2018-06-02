/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.font_CN_bullet);

var x_scale=string_width(bulletText)*1.2/sprite_get_width(spr_bullet_fontSize); 
draw_sprite_ext(spr_bullet_fontSize,0,x_bulletSelf,y_bulletSelf,size*x_scale,size,360-speedAngle,c_white,1);

draw_set_color(c_black);
var shadow;
for(shadow=1;shadow<3;shadow++){
	draw_text_transformed(x_bulletSelf+shadow*2,y_bulletSelf+shadow*2,bulletText,size,size,360-speedAngle);
}

draw_set_color(c_white);
draw_text_transformed(x_bulletSelf,y_bulletSelf,bulletText,size,size,360-speedAngle);