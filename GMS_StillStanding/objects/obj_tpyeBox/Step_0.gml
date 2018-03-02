/// @description Insert description here
// You can write your code in this editor
if(clickTimer>0)
	clickTimer--;

if(isSelected){
	if(keyboard_check(vk_anykey) && string_length(text)<MAX_LENGTH){
		text=text+string(keyboard_string);
		keyboard_string="";
	}

	if(keyboard_check_pressed(vk_backspace)){
		text=string_delete(text,string_length(text),1);
		keyboard_string="";
	}
	
}