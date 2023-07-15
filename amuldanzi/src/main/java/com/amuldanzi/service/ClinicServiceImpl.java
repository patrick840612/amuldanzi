package com.amuldanzi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.persistence.ClinicRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service("clinicService")
public class ClinicServiceImpl implements ClinicService {

	@Autowired
	ClinicRepository clinicRepo;

	@Override
	public List<HashMap<String, Object>> getAllClinics() {
		
		List<Object[]> locationData = clinicRepo.findLocation();
		
		List<HashMap<String, Object>> result = new ArrayList<>();
	    // 주소가 '서울'인 데이터만 필터링
	    for (Object[] objArray : locationData) {
	    	HashMap<String, Object> map = new HashMap<>();
	             
	            map.put("title", objArray[0]);
	            // 필요한 다른 필드들도 추가할 수 있습니다. 
	            map.put("addr", objArray[1]);
	            map.put("tel", objArray[2]);
	            map.put("time", objArray[3]);
	            map.put("lat", objArray[4]);
	            map.put("lng", objArray[5]);
	            result.add(map);
	        
	    }
		return  result;
	}

	@Override
	public List<Map<String,String>> getAllHospital() {
		
		return clinicRepo.findAllHospital();
	}

	@Override
	public List<HashMap<String, Object>> searchByLocation(String location) { 

	    // DB에서 주소 가져오기
	    List<Object[]> seoulData = clinicRepo.getAllAddresses(location);

	    
	    List<HashMap<String, Object>> result = new ArrayList<>();
	    // 주소가 '서울'인 데이터만 필터링
	    for (Object[] objArray : seoulData) {
	    	HashMap<String, Object> map = new HashMap<>();
	             
	            map.put("title", objArray[0]);
	            // 필요한 다른 필드들도 추가할 수 있습니다. 
	            map.put("addr", objArray[1]);
	            map.put("tel", objArray[2]);
	            map.put("time", objArray[3]);
	            result.add(map);
	        
	    }

	    return result;
	}
 
		 
}
