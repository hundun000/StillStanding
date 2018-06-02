/// @description Insert description here
// You can write your code in this editor
var space=64;
var i;

draw_set_font(global.font_CN_mainMenu);

var x_scale=(string_width(option[3])+200)/sprite_get_width(spr_main_backBoard);
var y_scale=(numOption+2)*space/sprite_get_height(spr_main_backBoard);
draw_sprite_ext(spr_main_backBoard,0,x-100,y-space,x_scale,y_scale,0,c_white,1);





for(i=0;i<numOption;i++){
	draw_text(x,y+i*space,option[i]);
}

draw_sprite(spr_OptionSeleting,0,x-64,y+targetOptionIndex*space);


//draw_text(0,room_height-100,"程序working_directory为："+working_directory);
//draw_text(0,room_height-50,"程序program_directory为："+program_directory);