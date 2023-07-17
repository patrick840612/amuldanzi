package com.amuldanzi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amuldanzi.domain.ClinicDTO;

public interface ClinicService {

	//List<ClinicDTO> getClinicList();

	//ClinicDTO clinicList(ClinicDTO dto);

	//void clinicUpdate(ClinicDTO dto);

	List<HashMap<String, Object>> getAllClinics();

	List<Map<String, String>> getAllHospital();
  
	List<HashMap<String, Object>> searchByLocation(String location);
 
 
	
	


}
