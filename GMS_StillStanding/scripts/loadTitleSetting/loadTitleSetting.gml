///@argument0 ins_title
var ins_title=argument0;

var filePath=working_directory+"基本设置.txt";
if(!file_exists(filePath)){
	show_message("基本设置文件不存在");
	return;
}

ini_open(filePath);

var sectionName;
var i,j;

sectionName="Title Setting";
var titleText=ini_read_string(sectionName,"titleText",DEFAULT_TITLE_TEXT);
var titleSize=ini_read_real(sectionName,"titleSize",DEFAULT_TITLE_SIZE);
if(titleSize>128) titleSize=128;

ins_title.titleText=titleText;
ins_title.titleSize=titleSize;
ins_title.font=font_add("ARIALUNI_fixed.ttf",titleSize,0,0,32,128);



ini_close();