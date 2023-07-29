package com.amuldanzi.persistence;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CareDTO;

public interface CareRepository extends CrudRepository<CareDTO, Integer> {

	// careId로 케어정보 찾기
	Optional<CareDTO> findById(Integer careId);
	



	// 2개의 최신 케어정보를 조회
	@Query(value = "SELECT * FROM care  ORDER BY id DESC LIMIT 2", nativeQuery = true)
	List<CareDTO> selectByRecent();

	@Query(value = "UPDATE care SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

	@Query(value = "UPDATE care SET video = NULL WHERE video = :vidoeName", nativeQuery = true)
	void deleteVideo(@Param("vidoeName") String vidoeName);


}
