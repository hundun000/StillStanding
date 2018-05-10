/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(roomManager.ROOM_FONT);

switch(soundState){
	case SoundState.SOUND_NOT_INIT:
		image_index=0;
		draw_set_color(c_black);
		draw_text(x,y,"等待题目");		
		break;	
	case SoundState.SOUND_NOT_WORK:
		image_index=0;
		draw_set_color(c_black);
		draw_text(x,y,"无音频");		
		break;
	case SoundState.SOUND_FIRST_PLAYING:
	case SoundState.SOUND_AGAIN_PLAYING:
		image_index=1;
		draw_set_color(c_orange);
		var length=audio_sound_length(ins_snd);
		var curTime=audio_sound_get_track_position(ins_snd);
		var remainTime=length-curTime;
		draw_text(x,y,"剩余"+string(floor(remainTime))+"秒");
		break;
	case SoundState.SOUND_WAIT_FIRST_PLAY:
		image_index=2;
		draw_set_color(c_orange);
		draw_text(x,y,"点击首次播放");
		break;
	case SoundState.SOUND_STOP:
		image_index=2;
		draw_set_color(c_orange);
			draw_text(x,y,"点击重新播放");
		break;	
}