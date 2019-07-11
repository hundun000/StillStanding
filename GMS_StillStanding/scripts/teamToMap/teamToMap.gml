///@argument0 ins_team
var ins_team = argument0;
var objectMap = ds_map_create();


ds_map_add(objectMap, "name", ins_team.name);
var tempList0 = ds_list_create();
ds_list_copy(tempList0, ins_team.banGroupNames);
ds_map_add_list(objectMap, "banNames", tempList0);
var tempList1 = ds_list_create();
ds_list_copy(tempList1, ins_team.banGroupNames);
ds_map_add_list(objectMap, "pickNames", tempList1);

return objectMap;