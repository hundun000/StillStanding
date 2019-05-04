/// @description Insert description here
// You can write your code in this editor
#macro DEFAULT_TITLE_TEXT "一站到底"
#macro DEFAULT_TITLE_SIZE 40

titleText=DEFAULT_TITLE_TEXT;
titleSize=DEFAULT_TITLE_SIZE;
font=noone;
//loadTitleSetting();
get_request = http_get("https://jsonplaceholder.typicode.com/comments/1");
var titleText = DEFAULT_TITLE_TEXT;
var titleSize = DEFAULT_TITLE_SIZE;
if(titleSize>128) titleSize=128;

self.titleText=titleText;
self.titleSize=titleSize;
self.font=font_add("ARIALUNI_fixed.ttf",titleSize,0,0,32,128);