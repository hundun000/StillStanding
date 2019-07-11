/// @description Insert description here
// You can write your code in this editor
#macro DEPTH_MANAGER 0

#macro DIRECTORY_GROUP "group/"
#macro DIRECTORY_RESOURCE "resource/"
#macro DIRECTORY_SOUND_RESOURCE "sound_resource/"
#macro DIRECTORY_SANDBOX "sandbox/"


#macro STRING_NO_RESOURCE "无资源"

#macro GAME_FPS 60

enum InputReceiver{
	MAIN_MENU,
	TEAM_MANAGER,
	PLAY_MANAGER,
	MATCH_MANAGER,
	RULE_MANAGER,
	GROUP_MANAGER

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

font_room_normal=font_add("ARIALUNI_fixed.ttf",25,0,0,32,128);

global.font_CN_play=font_room_normal;
global.font_CN_teamEdit=font_room_normal;
global.font_CN_typeBox=font_room_normal;
global.font_CN_mainMenu=font_room_normal;
global.font_CN_match=font_room_normal;
global.font_CN_bullet=font_room_normal;



global.font_teamList_smallest=font_add("ARIALUNI_fixed.ttf",15,0,0,32,128);
global.font_teamList_smaller=font_add("ARIALUNI_fixed.ttf",18,0,0,32,128);
global.font_teamList_small=font_add("ARIALUNI_fixed.ttf",21,0,0,32,128);
global.font_teamList_normal=font_room_normal;


//******** instance init ********
mainMenuManager=instance_find(obj_mainMenuManager,0);
teamManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_teamManager);
global.groupManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_groupManager);
global.blockManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_blockManager);
playManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_playManager);
matchManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_matchManger);
ruleManager=instance_create_depth(0,0,DEPTH_MANAGER,obj_ruleManager);
instance_create_depth(room_width/2,room_height/2,DEPTH_LOG_BOARD,obj_logManager);
//******* data init secend time *********
randomise();
		
config_NUM_GROUP_PICKABLE=1;
config_FULL_PICK_CHANCE=1;


loadGameSetting();
//loadTeams(noone);
loadTeamsV2();
loadRules(noone);
loadGroups();
generatePickableGroups();
generateBanableGroups();



//window_set_fullscreen(true);