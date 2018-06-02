/// @description Insert description here
// You can write your code in this editor
if(dataManager.ins_curBlock!=noone){
	text=dataManager.ins_curBlock.question;
	var charPerLine=23;

	var length=string_length(text);
	var numLine=length div charPerLine;
	var i;
	for(i=0;i<numLine;i++){
		var nextLinePosition=(i+1)*(charPerLine+1);
		text=string_insert("\n",text,nextLinePosition);
	}
	
}