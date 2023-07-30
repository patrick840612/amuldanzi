package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.BusinessDTO;

public interface BusinessDAO extends CrudRepository<BusinessDTO, String>
{

	@Query(value = "SELECT * FROM business WHERE id = :id", nativeQuery = true)
	List<BusinessDTO> findByMemberId(String id);
	
	@Query(value = "UPDATE business SET business_name = :#{#business.businessName}, business_sector = :#{#business.businessSector}, business_img = :#{#business.businessImg} WHERE business_number = :#{#business.businessNumber}", nativeQuery = true)
	void businessUpdate(BusinessDTO business);
	
}
