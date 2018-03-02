/// @description Insert description here
// You can write your code in this editor
event_inherited();


option[0]="读取文件";
option[1]="上一题";
option[2]="下一题";
option[3]="队伍编辑";
option[4]="离开";
numOption=array_length_1d(option);


targetOptionIndex=0;
curBlockIndex=-1;
ins_typeBox=instance_create_depth(500,50,1,obj_TpyeBox);
ins_block=noone;