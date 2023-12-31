package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.EducationDTO;

public interface EducationService {

	List<EducationDTO> geteduList();
 
	EducationDTO getEduDetail(String id);

	List<String> getVideoList(String title);

	List<EducationDTO> getEduListRecent();
 

}
