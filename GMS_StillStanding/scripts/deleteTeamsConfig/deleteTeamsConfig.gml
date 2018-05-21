var teamList=global.thisGame.teamManager.teams;

ds_list_clear(teamList);
instance_destroy(obj_team);

if(file_exists(working_directory+DIRECTORY_SANDBOX+"参赛队伍.txt"))
	file_delete(working_directory+DIRECTORY_SANDBOX+"参赛队伍.txt");