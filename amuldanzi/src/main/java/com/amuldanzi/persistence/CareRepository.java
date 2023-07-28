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
	
	// 이미지 파일명을 기준으로 해당 이미지를 삭제
	@Query(value = "DELETE FROM care WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

	// 2개의 최신 케어정보를 조회
	@Query(value = "SELECT * FROM care  ORDER BY id DESC LIMIT 2", nativeQuery = true)
	List<CareDTO> selectByRecent();

}
