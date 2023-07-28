package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommerceDTO;

public interface CommerceRepository extends CrudRepository<CommerceDTO, Integer>{
	
	@Query(value = "UPDATE commerce SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

}
