package com.amuldanzi.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MarketGoodsDTO;

public interface MarketRepository extends CrudRepository<MarketGoodsDTO, Integer>{
	
	@Query("SELECT m FROM MarketGoodsDTO m WHERE m.marketCate.cateId = 1")
	Page<MarketGoodsDTO> findMarketCate(Pageable paging);
	
	@Query("SELECT m FROM MarketGoodsDTO m WHERE m.marketCate.cateId = 2")
	Page<MarketGoodsDTO> findDolbomiCate(Pageable paging);

}
