///@argument0 ins_resource
///@argument1 resourceName

var ins_resource=argument0;
var resourceName=argument1;


var fileName=working_directory+DIRECTORY_RESOURCE+resourceName;

if(!file_exists(fileName)){
	show_message("resource not exists");
	return noone;
}

//var last_x=ins_resource.x;
//var last_y=ins_resource.y;
sprite_replace(ins_resource.sprite_index,fileName,1,false,false,0,0);

var xscale=RESOURCE_WIDTH/sprite_get_width(ins_resource.sprite_index);
var yscale=RESOURCE_HEIGHT/sprite_get_height(ins_resource.sprite_index);
var scale=min(xscale,yscale);
ins_resource.image_xscale=scale;
ins_resource.image_yscale=scale;

return 1;