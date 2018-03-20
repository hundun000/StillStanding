///@argument0 resourceName
enum ResourceType{
	IMAGE,SOUND,NONE
}



var resourceName=argument0;

if(string_pos(".png",resourceName)!=0||string_pos(".jpg",resourceName)!=0){
	return ResourceType.IMAGE;
}
else if(string_pos(".ogg",resourceName)!=0){
	return ResourceType.SOUND;	
}
else
	return ResourceType.NONE;