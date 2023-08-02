package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.AdvertisementDTO;

public interface AdvertisementRepository extends CrudRepository<AdvertisementDTO, Integer> {
	
	@Query(value = "UPDATE advertisement SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);
	
	// 게시글 번호에 해당하는 신고 정보 삭제 
	@Modifying
	@Query(value = "DELETE FROM cm_blame WHERE comm_no = :commNo", nativeQuery = true)
	void deleteByBlame(@Param("commNo") Integer comm_no);	
	
}
