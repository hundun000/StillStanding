/// @description Insert description here
// You can write your code in this editor
if(soundStream!=noone&&!audio_is_playing(soundStream)){
	ins_snd=audio_play_sound(soundStream, 200, false);
	hadPlay=true;
}