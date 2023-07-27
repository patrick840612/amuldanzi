package com.amuldanzi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.MarketGoodsDTO;
import com.amuldanzi.persistence.MarketRepository; 

@Service("marketService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	MarketRepository marketRepo;

	@Override
	public Page<MarketGoodsDTO> findMarketCate(Pageable paging) {
		return marketRepo.findMarketCate(paging);
	}

	@Override
	public Page<MarketGoodsDTO> findDolbomiCate(Pageable paging) {
		return marketRepo.findDolbomiCate(paging);
	}

	@Override
	public MarketGoodsDTO findById(Integer goodsId) {
		return marketRepo.findById(goodsId).get();
	}
	
	
	
	


}
