///@argument0 bodyString
var bodyString = argument0;
var teamList = global.thisGame.teamManager.teams;

ds_list_clear(teamList);
instance_destroy(obj_team);

var bodyMap = json_decode(bodyString);
var teams = ds_map_find_value(bodyMap, "teams");

var numTeam = ds_list_size(teams);
show_debug_message("numTeam" + string(numTeam));
for(var i = 0; i < numTeam; i++){
	ds_list_mark_as_map(teams, i);
	var teamMap = ds_list_find_value(teams, i);
	
	var ins_nextTeam = instance_create_depth(0,0,1,obj_team);
	ins_nextTeam.name = ds_map_find_value(teamMap, "name");
	ds_list_copy(ins_nextTeam.pickGroupNames, ds_map_find_value(teamMap, "pickTags"));
	ds_list_copy(ins_nextTeam.banGroupNames, ds_map_find_value(teamMap, "banTags"));
	
	ds_list_add(teamList,ins_nextTeam);
}
ds_map_destroy(bodyMap);