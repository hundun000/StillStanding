/// @description Insert description here
// You can write your code in this editor
if(image_index==0){
	if(frameCounter++==GAME_FPS*2){
		image_index=index;	
		frameCounter=0;
	}
}