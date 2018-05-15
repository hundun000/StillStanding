/// @description Insert description here
// You can write your code in this editor

var size=ds_list_size(roomManager.ins_match.teams);
var x_text=x;
var y_text=y;
var space=20;
draw_set_color(c_black);
	
if(size==0){
	draw_text(x_text,y_text,"无");
}
else{
	var i;

	for(i=0;i<size;i++){
		var ins_team=ds_list_find_value(roomManager.ins_match.teams,i);
		draw_text(x_text,y_text+i*(font_get_size(roomManager.ROOM_FONT)+space),ins_team.name);
	}
		
}
	
	

