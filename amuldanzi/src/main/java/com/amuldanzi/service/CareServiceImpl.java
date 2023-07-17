package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.persistence.CareRepository;
import com.amuldanzi.persistence.EducationRepository;
import com.amuldanzi.persistence.NoticeRepository;

@Service("CareService")
public class CareServiceImpl implements CareService {

	@Autowired
	CareRepository careRepo;

	@Override
	public List<CareDTO> getCareList() {
		// TODO Auto-generated method stub
		return (List<CareDTO>)careRepo.findAll();
	}

	@Override
	public CareDTO getCareByCareId(Integer careId) {
		// TODO Auto-generated method stub
		return careRepo.findById(careId).orElse(null);
	}

	

}
