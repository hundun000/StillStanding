/// @description Insert description here
// You can write your code in this editor
draw_set_font(roomManager.ROOM_FONT);
event_inherited();

var charPerLine=10;

var length=string_length(text);
var numLine=length div charPerLine;
var i;
for(i=0;i<numLine;i++){
	var nextLinePosition=(i+1)*(charPerLine+1);
	text=string_insert("\n",text,nextLinePosition);
}
//text=string_hash_to_newline(text);



