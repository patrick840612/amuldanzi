package com.amuldanzi.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MarketGoodsDTO;

public interface MarketRepository extends CrudRepository<MarketGoodsDTO, Integer>{

	Page<MarketGoodsDTO> findAll(Pageable paging);

}
