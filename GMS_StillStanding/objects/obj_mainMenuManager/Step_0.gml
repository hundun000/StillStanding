/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.MAIN_MENU) return;

if(input_dy!=0){
		targetOptionIndex=(numOption+targetOptionIndex+input_dy)%numOption;
}

if(isA){
	switch(targetOptionIndex){
		case 0:
			var block=getTargetBlock(ins_typeBox.text,0);
			if(block!=noone){
				if(ins_block!=noone) instance_destroy(ins_block);	
				ins_block=block;
				curBlockIndex=0;
			}
		case 1:
			if(curBlockIndex!=-1){
				var block=getTargetBlock(ins_typeBox.text,curBlockIndex-1);
				if(block!=noone){
					if(ins_block!=noone) instance_destroy(ins_block);	
					ins_block=block;
					curBlockIndex--;
				}
			}
			break;
		case 2:			
			if(curBlockIndex!=-1){
				var block=getTargetBlock(ins_typeBox.text,curBlockIndex+1);
				if(block!=noone){
					if(ins_block!=noone) instance_destroy(ins_block);	
					ins_block=block;
					curBlockIndex++;
				}
			}	
			break;	
		case 3:
			game_end();
			break;

	}
}