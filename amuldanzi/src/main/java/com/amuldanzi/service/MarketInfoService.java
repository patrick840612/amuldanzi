package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MarketInfoService {

	List<HashMap<String, Object>> getAllmarket();
 
	List<Map<String, String>> getAllmarketInfo();
	 
	
	List<HashMap<String, Object>> searchByLocation(String location);

	


}
