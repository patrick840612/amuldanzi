package com.amuldanzi.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.MarketInfoDTO;

public interface MarketInfoRepository extends CrudRepository<MarketInfoDTO, Integer>{

	@Query("SELECT m.title title, m.addr addr, m.tel tel, m.time time , m.lat lat, m.lng lng FROM MarketInfoDTO m")
	List<Object[]> findLocation();

	@Query("SELECT m.title title, m.addr addr, m.tel tel, m.time time  FROM MarketInfoDTO m")
	List<Map<String, String>> findAllmarket();

	@Query(value = "SELECT m.title AS title, m.addr AS addr, m.tel AS tel, m.time AS time, m.lat AS lat, m.lng AS lng FROM market m WHERE SUBSTRING(m.addr, 1, 2) = SUBSTRING(:addr, 1, 2)", nativeQuery = true)
	List<Object[]> getAllAddresses(@Param("addr") String location);

}
