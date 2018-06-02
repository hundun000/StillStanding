var logType=argument0;
var text=argument1;

var msg="["+string(logType)+"]"+text;
show_debug_message(msg);

global.logManager.text+=msg+"\n";

var len=string_length(global.logManager.text);
if(len>600){
	var newText=string_copy(global.logManager.text,len-50+1,150);
	global.logManager.text=newText;
}