package com.amuldanzi.persistence;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CareDTO;

public interface CareRepository extends CrudRepository<CareDTO, Integer> {

	Optional<CareDTO> findById(Integer careId);
	
	@Query(value = "UPDATE care SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

	@Query(value = "UPDATE care SET video = NULL WHERE video = :vidoeName", nativeQuery = true)
	void deleteVideo(@Param("vidoeName") String vidoeName);

}
