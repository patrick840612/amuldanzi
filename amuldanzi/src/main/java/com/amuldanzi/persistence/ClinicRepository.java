package com.amuldanzi.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.ClinicDTO;

public interface ClinicRepository extends CrudRepository<ClinicDTO, Integer> {

	@Query("SELECT c.title title, c.addr addr, c.tel tel, c.time time , c.lat lat,c.lng lng FROM ClinicDTO c")
	List<Object[]> findLocation();

	@Query("SELECT c.title title, c.addr addr, c.tel tel, c.time time  FROM ClinicDTO c")
	List<Map<String, String>> findAllHospital();

	//@Query("SELECT  title as title, c.addr as addr, c.tel as tel, c.time as time  FROM ClinicDTO c WHERE c.addr LIKE CONCAT('%', :addr, '%')")  
	@Query(value = "SELECT c.title AS title, c.addr AS addr, c.tel AS tel, c.time AS time, c.lat AS lat, c.lng AS lng FROM clinic c WHERE c.addr LIKE %:addr%", nativeQuery = true)
	List<Object[]> getAllAddresses(@Param("addr") String addr);



}
