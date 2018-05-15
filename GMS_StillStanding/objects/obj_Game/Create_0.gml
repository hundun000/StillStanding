/// @description Insert description here
// You can write your code in this editor
#macro DEPTH_MANAGER 0

#macro DIRECTORY_GROUP "group/"
#macro DIRECTORY_RESOURCE "resource/"
#macro DIRECTORY_SOUND_RESOURCE "sound_resource/"

#macro STRING_NO_RESOURCE "无资源"

#macro GAME_FPS 60

enum InputReceiver{
	MAIN_MENU,
	TEAM_MANAGER,
	PLAY_MANAGER,
	MATCH_MANAGER

}

#macro BTN_A ord("Z")
#macro BTN_B ord("X")
#macro BTN_U vk_up
#macro BTN_D vk_down
#macro BTN_L vk_left
#macro BTN_R vk_right

//********* data init*************
game_set_speed(GAME_FPS,gamespeed_fps);


global.thisGame=id;
global.inputReceiver=InputReceiver.MAIN_MENU;

global.font_CN_play=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_teamEdit=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_typeBox=font_add("ARIALUNI_fixed.ttf",25,0,0,32,128);
global.font_CN_mainMenu=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_match=font_add("ARIALUNI_fixed.ttf",20,0,0,32,128);
global.font_CN_bullet=font_add("ARIALUNI_fixed.ttf",32,0,0,32,128);

//******** instance init ********
mainMenuManager=instance_find(obj_mainMenuManager,0);
teamManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_teamManager);
global.groupManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_groupManager);
global.blockManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_blockManager);
playManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_playManager);
matchManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_matchManger);
ruleManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_ruleManager);

//******* data init secend time *********
loadTeams(teamManager.teams);
loadRules(ruleManager);