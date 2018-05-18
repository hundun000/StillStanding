var file;
file = get_open_filename("参赛队伍|*.txt", "");
if(file!=""){
	//write into manager
	loadTeams(file);
	//write into sandbox
	saveTeams();
}