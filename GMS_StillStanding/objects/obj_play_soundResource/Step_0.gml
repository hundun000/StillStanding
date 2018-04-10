/// @description Insert description here
// You can write your code in this editor
if(dataManager.ins_curBlock!=noone
   &&getResourceType(dataManager.ins_curBlock.resourcesName)==ResourceType.SOUND){
	
	if(hadPlay==noone){
		curResourceName=dataManager.ins_curBlock.resourcesName;
		prepareSound(id,curResourceName);
		hadPlay=false;
	}
	
	
	
	
	if(audio_is_playing(soundStream)){
		image_index=1;
	}
	else{
		if(hadPlay&&roomManager.playState==PlayState.WAIT_SOUND_FIRST_TIME_PLAY){
			roomManager.playState=PlayState.WAIT_SELECT_OPTION;
		}
		image_index=2;	
	}
	

	
	if(roomManager.playState==PlayState.JUDGE_SELECT_OPTION&&soundStream!=noone){
		audio_stop_sound(ins_snd);	
		audio_destroy_stream(soundStream);
		//reset
		hadPlay=noone;
		soundStream=noone;
		ins_snd=noone;
	}

	
}
else{
	image_index=0;
}