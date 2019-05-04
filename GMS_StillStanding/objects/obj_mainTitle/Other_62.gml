if (ds_map_find_value(async_load, "id") == get_request)
{
	if (ds_map_find_value(async_load, "status") == 0)
	{
		var body = ds_map_find_value(async_load, "result");
		var bodyMap = json_decode(body);
		
		
		var titleText = ds_map_find_value(bodyMap, "name");
		var titleSize = DEFAULT_TITLE_SIZE;
		if(titleSize>128) titleSize=128;

		self.titleText=titleText;
		self.titleSize=titleSize;
	}
	
	
}
