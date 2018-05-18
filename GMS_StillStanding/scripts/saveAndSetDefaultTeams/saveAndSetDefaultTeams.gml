var teamList=global.thisGame.teamManager.teams;


ds_list_clear(teamList);
instance_destroy(obj_team);
var ins_team=instance_create_depth(0,0,1,obj_team);
ins_team.name="默认队名";
ds_list_add(teamList,ins_team);

saveTeams();