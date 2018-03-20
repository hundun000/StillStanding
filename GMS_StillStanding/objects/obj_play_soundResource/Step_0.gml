/// @description Insert description here
// You can write your code in this editor
if(dataManager.ins_curBlock!=noone
   &&getResourceType(dataManager.ins_curBlock.resourcesName)==ResourceType.SOUND){
	
	if(curResourceName!=dataManager.ins_curBlock.resourcesName){
		curResourceName=dataManager.ins_curBlock.resourcesName;
		prepareSound(id,curResourceName);
		hadPlay=false;
	}
	
	
	
	
	if(audio_is_playing(sound)){
		image_index=1;
	}
	else{
		if(hadPlay&&roomManager.playState==PlayState.WAIT_SOUND_FIRST_TIME_PLAY){
			roomManager.playState=PlayState.WAIT_SELECT_OPTION;
		}
		image_index=2;	
	}
	

	
	if(roomManager.playState==PlayState.JUDGE_SELECT_OPTION){
		audio_stop_sound(sound);	
		audio_destroy_stream(curResourceName);
		curResourceName=noone;
	}

	
}
else{
	image_index=0;
	curResourceName=noone;
	sound=noone;
}