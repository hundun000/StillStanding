/// @description Insert description here
// You can write your code in this editor

switch(soundState){
	case SoundState.SOUND_NOT_INIT:
		if(roomManager.playState==PlayState.WAIT_SOUND_FIRST_TIME_PLAY){
			
				curResourceName=dataManager.ins_curBlock.resourcesName;
				
				var fileName=working_directory+DIRECTORY_SOUND_RESOURCE+curResourceName;
				if(!file_exists(fileName)){
					//show_message("音频资源未找到");
					soundState=SoundState.SOUND_NOT_WORK;
					return;
				}
				else{
					soundStream=audio_create_stream(fileName);
				
					soundState=SoundState.SOUND_WAIT_FIRST_PLAY;
				}
		}
		else if(roomManager.playState==PlayState.WAIT_SELECT_OPTION){
			soundState=SoundState.SOUND_NOT_WORK;
		}

		break;
		
	case SoundState.SOUND_WAIT_FIRST_PLAY:
		//wait click event chang
		break;
	case SoundState.SOUND_FIRST_PLAYING:
		if(!audio_is_playing(soundStream)){
			roomManager.playState=PlayState.WAIT_SELECT_OPTION;
			soundState=SoundState.SOUND_STOP;
		}
		break;
	case SoundState.SOUND_AGAIN_PLAYING:	
		if(!audio_is_playing(soundStream)){
			soundState=SoundState.SOUND_STOP;
		}
		//not break	
	case SoundState.SOUND_STOP:	
		if(roomManager.playState!=PlayState.WAIT_SELECT_OPTION){
			//block finish,reset
			audio_stop_sound(ins_snd);
			
			var fileName=working_directory+DIRECTORY_SOUND_RESOURCE+curResourceName;
			if(!file_exists(fileName)){
				//show_message("resource not exists");
				return noone;
			}
			audio_destroy_stream(fileName);
			
			soundStream=noone;
			ins_snd=noone;
			soundState=SoundState.SOUND_NOT_INIT;
		}
		break;
	case SoundState.SOUND_NOT_WORK:	
		if(roomManager.playState!=PlayState.WAIT_SELECT_OPTION){
			soundState=SoundState.SOUND_NOT_INIT;
		}
		break;
		
}
