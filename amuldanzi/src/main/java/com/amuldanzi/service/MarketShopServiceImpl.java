package com.amuldanzi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.persistence.MarketShopRepository;

@Service("MarketShopService")
public class MarketShopServiceImpl implements MarketShopService {

	@Autowired
	MarketShopRepository marketshopRepo;
	
	@Override
	public List<MarketDTO> getMarketShopList() {
		//return (List<MarketDTO>)marketshopRepo.findAll();
		return null; //흑흑 ㅠㅠ
	}

	@Override
	public MarketDTO marketshopList(MarketDTO dto) {
		return marketshopRepo.findById(dto.getId()).get();
	}

	@Override
	public void marketShopUpdate(MarketDTO dto) {
		
		marketshopRepo.save(dto);
		
	}

}
