package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.EducationDTO;

public interface EducationRepository extends CrudRepository<EducationDTO, Integer> {
	
	
	@Query(value = "DELETE FROM education WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

}
