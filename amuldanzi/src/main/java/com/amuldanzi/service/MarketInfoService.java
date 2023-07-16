package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.MarketInfoDTO;

public interface MarketInfoService {

	List<HashMap<String, Object>> getAllmarket();
 
	List<Map<String, String>> getAllmarketInfo();
	 
	
	List<HashMap<String, Object>> searchByLocation(String location);

	


}
