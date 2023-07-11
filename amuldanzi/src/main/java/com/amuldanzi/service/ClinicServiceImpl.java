package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.persistence.ClinicRepository;

@Service("clinicService")
public class ClinicServiceImpl implements ClinicService {

	@Autowired
	ClinicRepository clinicRepo;
	
	@Override
	public List<ClinicDTO> getClinicList() {
		return (List<ClinicDTO>)clinicRepo.findAll();
	}
	
	@Override
	public ClinicDTO clinicList(ClinicDTO dto) {
		return clinicRepo.findById(dto.getId()).get();
	}

	@Override
	public void clinicUpdate(ClinicDTO dto) {
		clinicRepo.save(dto);
		
	}

	

}
