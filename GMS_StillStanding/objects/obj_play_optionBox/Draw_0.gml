/// @description Insert description here
// You can write your code in this editor
var x_text=x+20;

if(roomManager.playState!=PlayState.WAIT_JUDGE_ANIMATION){

	if(roomManager.playState==PlayState.JUDGE_SELECT_OPTION){
		if(roomManager.selectedOptionIndex==index)
			draw_self();	
		else
			draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_gray,1);
		
		
		
		var subimage;
		if(index==castOptionToIndex(dataManager.ins_curBlock.rightAnswer))
			subimage=0;
		else
			subimage=1;	
	
		draw_sprite(spr_judge,subimage,x-64,y);
	}
	else
		draw_self();
		
	draw_set_font(roomManager.ROOM_FONT);
	draw_set_font(global.font_CN_typeBox);
	draw_set_color(c_black);
	draw_text(x_text,y,">"+text);	
		
}

