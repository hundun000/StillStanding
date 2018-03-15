ds_list_clear(global.blockManager.usedBlockCodes);
var size=ds_list_size(global.groupManager.groupNumUsedBlocks);
for(var i=0;i<size;i++)
	ds_list_replace(global.groupManager.groupNumUsedBlocks,i,0);