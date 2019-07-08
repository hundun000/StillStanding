///@argument0 ins_team
var ins_team = argument0;
var objectMap = ds_map_create();


ds_map_add(objectMap, "name", ins_team.name);
ds_map_add_list(objectMap, "banNames", ins_team.banGroupNames);
ds_map_add_list(objectMap, "pickNames", ins_team.pickGroupNames);

return objectMap;