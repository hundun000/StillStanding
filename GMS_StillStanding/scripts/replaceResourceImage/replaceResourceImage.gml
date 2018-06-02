///@argument0 ins_resource
///@argument1 resourceName

var ins_resource=argument0;
var resourceName=argument1;


var fileName=working_directory+DIRECTORY_RESOURCE+resourceName;

if(!file_exists(fileName)){
	show_message("图片资源未找到");
	return noone;
}

//var last_x=ins_resource.x;
//var last_y=ins_resource.y;

sprite_replace(ins_resource.sprite_index,fileName,1,false,false,0,0);
show_debug_message("source:"+string(ins_resource.sprite_width)+"x"+string(ins_resource.sprite_height));
var xscale=ins_resource.FRAME_WIDTH/ins_resource.sprite_width;
var yscale=ins_resource.FRAME_HEIGHT/ins_resource.sprite_height;
var scale=min(xscale,yscale);
var newWidth=scale*ins_resource.sprite_width;
var newHeight=scale*ins_resource.sprite_height;

ins_resource.image_xscale=scale;
ins_resource.image_yscale=scale;
show_debug_message("new:"+string(ins_resource.sprite_width)+"x"+string(ins_resource.sprite_height));

return 1;