package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.EducationDTO;

public interface EducationRepository extends CrudRepository<EducationDTO, Integer> {
	
	
	@Query(value = "UPDATE education SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);
	
	@Query(value = "UPDATE education SET video = NULL WHERE video = :vidoeName", nativeQuery = true)
	void deleteVideo(@Param("vidoeName") String vidoeName);
 
	
	@Query(value = "SELECT * FROM education GROUP BY title",nativeQuery = true)
	List<EducationDTO> selectEduList();

	
	@Query("SELECT e FROM EducationDTO e WHERE e.id = :id")
	EducationDTO selectEduTitle(@Param("id") String id);

	@Query("SELECT e.video FROM EducationDTO e WHERE e.title = :title")
	List<String> selectVideoList(@Param("title") String title);

}
