/// @description Insert description here
// You can write your code in this editor
switch(soundState){
	case SoundState.SOUND_WAIT_FIRST_PLAY:
		ins_snd=audio_play_sound(soundStream, 200, false);
		soundState=SoundState.SOUND_FIRST_PLAYING;
		break;
	case SoundState.SOUND_STOP:
		ins_snd=audio_play_sound(soundStream, 200, false);
		soundState=SoundState.SOUND_AGAIN_PLAYING;
		break;
	
}
