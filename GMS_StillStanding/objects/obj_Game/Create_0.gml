/// @description Insert description here
// You can write your code in this editor
#macro DEPTH_MANAGER 0

#macro DIRECTORY_GROUP "group/"

enum InputReceiver{
	MAIN_MENU,
	TEAM_MANAGER,

}

#macro BTN_A ord("Z")
#macro BTN_B ord("X")
#macro BTN_U vk_up
#macro BTN_D vk_down
#macro BTN_L vk_left
#macro BTN_R vk_right

//********* data init*************
global.thisGame=id;
global.inputReceiver=InputReceiver.MAIN_MENU;

global.font_CN_teamEdit=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_typeBox=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_mainMenu=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);


//******** instance init ********
mainMenuManager=instance_find(obj_mainMenuManager,0);
teamManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_teamManager);
groupManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_groupManager);

