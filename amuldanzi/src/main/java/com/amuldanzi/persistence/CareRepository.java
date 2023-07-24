package com.amuldanzi.persistence;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CareDTO;

public interface CareRepository extends CrudRepository<CareDTO, Integer> {

	Optional<CareDTO> findById(Integer careId);
	
	@Query(value = "DELETE FROM care WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

}
