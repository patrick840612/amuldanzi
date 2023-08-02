package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommBlameDTO;

public interface CommBlameRepository extends CrudRepository<CommBlameDTO, Integer>{

	
	// 게시글 번호에 해당하는 신고 정보 삭제 
	@Modifying
	@Query(value = "DELETE FROM cm_blame WHERE comm_no = :commNo", nativeQuery = true)
	void blamedDeleteByCommNo(@Param("commNo") Integer comm_no);	


}
