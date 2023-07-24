package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.AdvertisementDTO;

public interface AdvertisementRepository extends CrudRepository<AdvertisementDTO, Integer> {
	
	@Query(value = "DELETE FROM advertisement WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

}
