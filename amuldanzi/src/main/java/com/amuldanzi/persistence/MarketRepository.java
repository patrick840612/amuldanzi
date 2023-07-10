package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MarketDTO;

public interface MarketRepository extends CrudRepository<MarketDTO, Integer>{

}
