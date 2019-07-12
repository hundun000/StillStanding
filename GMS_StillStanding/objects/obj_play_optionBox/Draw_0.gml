/// @description Insert description here
// You can write your code in this editor
if(!isBulletAnimation||roomManager.playState!=PlayState.WAIT_JUDGE_ANIMATION){
	draw_set_font(font);
	var x_offset=(sprite_width)/2-string_width(text)/2;
	var x_draw=x+x_offset;
	var y_draw=y+20;

	if(roomManager.playState==PlayState.JUDGE_SELECT_OPTION){
		if(roomManager.selectedOptionIndex==index)
			image_index=1;	
		else
			image_index=0;	
		draw_self();
		
		
		var subimage;
		if(index==dataManager.ins_curBlock.rightAnswer)
			subimage=0;
		else
			subimage=1;	
	
		draw_sprite_ext(spr_judge,subimage,x,y,image_xscale,image_yscale,0,c_white,1);
	}
	else{
		draw_self();
		
		if(roomManager.isShowWrong[index]){
			var subimage=1;
			draw_sprite_ext(spr_judge,subimage,x,y,image_xscale,image_yscale,0,c_white,1);
		}
		
		
	}
		

	draw_set_color(c_white);
	draw_text(x_draw,y_draw,text);	
		
}

