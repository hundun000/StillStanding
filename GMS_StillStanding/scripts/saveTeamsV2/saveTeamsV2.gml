var teamList = global.thisGame.teamManager.teams;
var bodyMap = ds_map_create();

var numTeam = ds_list_size(teamList);
for(var i = 0;i < numTeam; i++){
	var ins_team = ds_list_find_value(teamList, i);
	var objectMap = teamToMap(ins_team);
	ds_map_add_map(bodyMap, i, objectMap);
	
}

var bodyString = "teams=" + json_encode(bodyMap);
show_debug_message("send bodyString: " + bodyString);
global.thisGame.teamManager.req_saveTeams = http_post_string(host + "/teams", bodyString);

for (var i = 0; i < numTeam; i++){
	var objectMap = ds_map_find_value(bodyMap, i);
	ds_map_destroy(objectMap);
}
ds_map_destroy(bodyMap);