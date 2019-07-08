///@argument0 bodyString
var bodyString = argument0;
var teamList = global.thisGame.teamManager.teams;

ds_list_clear(teamList);
instance_destroy(obj_team);

var bodyMap = json_decode(bodyString);
var teams = ds_map_find_value(bodyMap, "teams");

var numTeam;
numTeam=file_text_read_real(fileRead); file_text_readln(fileRead); 
file_text_readln(fileRead); 
var i;
for(i=0;i<numTeam;i++){
	var ins_nextTeam=readNextTeam(fileRead);
	ds_list_add(teamList,ins_nextTeam);
}