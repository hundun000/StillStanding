/// @description Insert description here
// You can write your code in this editor
draw_self();

if(sound!=noone){
	var length=audio_sound_length(sound);
	var curTime=audio_sound_get_track_position(sound)
	var remainTime=length-curTime;
	draw_set_color(c_orange);
	draw_text(x,y,string(length)+" "+string(curTime));
}