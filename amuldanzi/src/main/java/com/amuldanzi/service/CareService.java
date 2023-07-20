package com.amuldanzi.service;

import java.util.List;

import com.amuldanzi.domain.CareDTO;

public interface CareService {

	List<CareDTO> getCareList();

	CareDTO getCareByCareId(Integer careId);


	

}