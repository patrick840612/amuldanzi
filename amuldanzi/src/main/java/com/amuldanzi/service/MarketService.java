package com.amuldanzi.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.amuldanzi.domain.MarketGoodsDTO;

public interface MarketService {

	Page<MarketGoodsDTO> findMarketCate(Pageable paging);
	Page<MarketGoodsDTO> findDolbomiCate(Pageable paging);
	
}
