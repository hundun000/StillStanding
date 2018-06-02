/// @description Insert description here
// You can write your code in this editor
if(frameCounter==0){
	//frameCounter=irandom(15)+30;
	var numNewPowder=irandom(6)-4;
	
	for(var i=0;i<numNewPowder;i++){
		var newPos=room_width*random(1);
		var newPowder=instance_create_depth(newPos,0,DEPTH_POWDER,obj_powder);
	}
	
}
else{
	frameCounter--;
}