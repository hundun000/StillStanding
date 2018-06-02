/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(roomManager.ROOM_FONT);
var x_draw=x;
var y_draw=y+130;
var text;

switch(soundState){
	case SoundState.SOUND_NOT_INIT:
		image_index=0;
		draw_set_color(c_gray);
		text="等待题目";		
		break;	
	case SoundState.SOUND_NOT_WORK:
		image_index=0;
		draw_set_color(c_gray);
		text="无音频";		
		break;
	case SoundState.SOUND_FIRST_PLAYING:
	case SoundState.SOUND_AGAIN_PLAYING:
		image_index=1;
		draw_set_color(c_black);
		var length=audio_sound_length(ins_snd);
		var curTime=audio_sound_get_track_position(ins_snd);
		var remainTime=length-curTime;
		text=string(floor(remainTime))+"秒";
		break;
	case SoundState.SOUND_WAIT_FIRST_PLAY:
		image_index=2;
		draw_set_color(c_black);
		text="首次播放";
		break;
	case SoundState.SOUND_STOP:
		image_index=2;
		draw_set_color(c_black);
		text="重新播放";
		break;	
}
draw_text(x_draw,y_draw,text);
