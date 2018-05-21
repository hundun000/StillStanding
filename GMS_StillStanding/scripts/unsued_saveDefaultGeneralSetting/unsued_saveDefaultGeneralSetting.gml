
#macro DEFAULT_TITLE_TEXT "一站到底"
#macro DEFAULT_TITLE_SIZE 48

var filePath=working_directory+"基本设置.txt";

ini_open(filePath);

var sectionName;
var i,j;

sectionName="Title Setting";

ini_write_string(sectionName,"titleText",DEFAULT_TITLE_TEXT);
ini_write_real(sectionName,"titleSize",DEFAULT_TITLE_SIZE);

ini_close();
