package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.CareDTO;

public interface CareService {

	// 케어 정보 목록 가져오기
	List<CareDTO> getCareList();

	// 특정 케어 Id에 해당하는 케어 정보 가져오기
	CareDTO getCareByCareId(Integer careId);

	// 최신 케어 정보 2개 가져오기
	List<CareDTO> getCareListRecent();

	

}