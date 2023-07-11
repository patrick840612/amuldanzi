package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.ClinicDTO;

public interface ClinicService {

	List<ClinicDTO> getClinicList();

	ClinicDTO clinicList(ClinicDTO dto);

	void clinicUpdate(ClinicDTO dto);

	
	
	


}
