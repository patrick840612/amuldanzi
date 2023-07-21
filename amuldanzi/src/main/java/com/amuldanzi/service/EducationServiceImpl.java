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
		
		return (List<EducationDTO>)eduRepo.findAll();
	}

	

}
