package com.amuldanzi.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.amuldanzi.domain.MarketGoodsDTO;

public interface MarketService {

	Page<MarketGoodsDTO> findAllWithPaging(Pageable paging);
}
