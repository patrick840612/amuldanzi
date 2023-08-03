package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.persistence.EducationRepository;

@Service("EducationService")
public class EducationServiceImpl implements EducationService {

	@Autowired
	EducationRepository eduRepo;

	@Override
	public List<EducationDTO> geteduList() {
		
		return (List<EducationDTO>)eduRepo.selectEduList();
	} 

	@Override
	public EducationDTO getEduDetail(String id) {
		// TODO Auto-generated method stub
		return (EducationDTO)eduRepo.selectEduTitle(id);
	}

	@Override
	public List<String> getVideoList(String title) { 
		
		
		return (List<String>)eduRepo.selectVideoList(title);
	}

	

}
