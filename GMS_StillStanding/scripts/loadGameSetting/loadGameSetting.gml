var ins_game = global.thisGame;

//var filePath="基本设置.txt";
//if(!file_exists(filePath)){
//	show_message("基本设置文件不存在,working_directory=" + working_directory);
//	return;
//}

//ini_open(filePath);

//var sectionName;

//sectionName="Game Setting";
//ins_game.config_FULL_PICK_CHANCE=ini_read_real(sectionName,"FULL_PICK_CHANCE",0);
//ins_game.config_NUM_GROUP_PICKABLE=ini_read_real(sectionName,"NUM_GROUP_PICKABLE",3);
ins_game.config_FULL_PICK_CHANCE = 0;
ins_game.config_NUM_GROUP_PICKABLE = 3;


//ini_close();