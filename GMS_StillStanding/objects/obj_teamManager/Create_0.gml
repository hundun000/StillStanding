/// @description Insert description here
// You can write your code in this editor
event_inherited();

enum TeamRoomState{
	SELECTING_TEAM,	
	SELECTING_GROUP,
}

ROOM_FONT=global.font_CN_teamEdit;


//actully not need,use as define 
teamRoomState=noone;
teams=ds_list_create();
selectedTeamIndex=-1;
selectedGroupIndex=-1;