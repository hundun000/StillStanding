var file;
file = get_open_filename("比赛规则|*.txt", "");
if(file!=""){
	//write into manager
	loadRules(file);
	//write into sandbox
	saveRules();
}