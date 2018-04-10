/// @description Insert description here
// You can write your code in this editor
draw_self();
if(soundStream!=noone){
	draw_set_color(c_orange);
	if(audio_is_playing(soundStream)){
		var length=audio_sound_length(ins_snd);
		var curTime=audio_sound_get_track_position(ins_snd);
		var remainTime=length-curTime;
		draw_text(x,y,string(floor(remainTime)));
	}	
	else{
		
		if(hadPlay)
			draw_text(x,y,"点击重新播放");
		else
			draw_text(x,y,"点击首次播放");
	}
	
}
else{
	draw_set_color(c_black);
	draw_text(x,y,"无音频");
}
