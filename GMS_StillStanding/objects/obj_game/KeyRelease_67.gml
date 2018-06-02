/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_congratulation))
	instance_destroy(obj_congratulation);
else
	instance_create_depth(0,0,DEPTH_MANAGER,obj_congratulation);