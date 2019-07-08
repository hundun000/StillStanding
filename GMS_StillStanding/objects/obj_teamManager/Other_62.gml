/// @description Insert description here
// You can write your code in this editor
if (ds_map_find_value(async_load, "id") == req_getTeams){
    if ds_map_find_value(async_load, "status") == 0
        {
        r_str = ds_map_find_value(async_load, "result");
        }
    else
        {
        r_str = "null";
        }
}