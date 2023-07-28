package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.EducationDTO;

public interface EducationRepository extends CrudRepository<EducationDTO, Integer> {
	
	
	@Query(value = "UPDATE education SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);
	
	@Query(value = "UPDATE education SET video = NULL WHERE video = :vidoeName", nativeQuery = true)
	void deleteVideo(@Param("vidoeName") String vidoeName);

}
