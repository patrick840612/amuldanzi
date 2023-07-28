package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.persistence.CareRepository;

@Service("CareService")
public class CareServiceImpl implements CareService {

	@Autowired
	CareRepository careRepo;

	// 케어정보 전체 목록
	@Override
	public List<CareDTO> getCareList() {
		return (List<CareDTO>)careRepo.findAll();
	}

	// Id에 따른 특정 케어 정보
	@Override
	public CareDTO getCareByCareId(Integer careId) {
		return careRepo.findById(careId).orElse(null);
	}

	// 최신 케어 정보 2개
	@Override
	public List<CareDTO> getCareListRecent() { 
		return careRepo.selectByRecent();
	}



	

}
