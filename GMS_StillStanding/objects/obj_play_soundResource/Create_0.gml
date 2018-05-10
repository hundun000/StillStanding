/// @description Insert description here
// You can write your code in this editor
enum SoundState{
	SOUND_NOT_INIT,
	SOUND_NOT_WORK,
	SOUND_WAIT_FIRST_PLAY,
	SOUND_FIRST_PLAYING,
	SOUND_STOP,
	SOUND_AGAIN_PLAYING
}


soundState=SoundState.SOUND_NOT_INIT;

roomManager=global.thisGame.playManager;
dataManager=global.blockManager;


curResourceName=noone;
soundStream=noone;
ins_snd=noone;