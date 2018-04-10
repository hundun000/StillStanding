///@argument0 ins_resource
///@argument1 resourceName
var ins_resource=argument0;
var resourceName=argument1;

var fileName=working_directory+DIRECTORY_SOUND_RESOURCE+resourceName;

if(!file_exists(fileName)){
	show_message("resource not exists");
	return noone;
}

ins_resource.soundStream= audio_create_stream(fileName);

return 1;