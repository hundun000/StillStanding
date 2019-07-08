var teamList = global.thisGame.teamManager.teams;
var bodyMap = ds_map_create();



var objectsList = ds_list_create();
var numTeam = ds_list_size(teamList);
for(var i = 0;i < numTeam; i++){
	var ins_nextTeam=ds_list_find_value(teamList, i);
	var objectMap = teamToMap(ins_nextTeam);
	ds_list_add(objectsList, objectMap);
	ds_list_mark_as_map(objectsList, i);
}

ds_map_add_list(bodyMap, "teams", objectsList);
var bodyString = json_encode(bodyMap);

show_debug_message(bodyString);
global.thisGame.teamManager.post_request = http_post_string(host + "/teams", bodyString);

for (var i = 0; i < numTeam; i++){
	var map = ds_list_find_value(objectsList, i);
	ds_map_destroy(map);
}
ds_list_destroy(objectsList);
ds_map_destroy(bodyMap);