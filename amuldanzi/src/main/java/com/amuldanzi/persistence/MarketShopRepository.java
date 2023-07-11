package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MarketDTO;

public interface MarketShopRepository extends CrudRepository<MarketDTO, Integer>{

}
