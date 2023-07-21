package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommunityDTO;

public interface CommImageRepository extends CrudRepository<CommImageDTO, Integer>{

	// 커뮤니티 글번호 기준 커뮤니티 이미지 파일 이름을 조회하는 쿼리
	@Query(value = "SELECT comm_img_file_name FROM comm_img ci WHERE comm_no = ?1", nativeQuery = true)
	List<String> findByCommNo(Integer comm_no);

	// 해당 이미지 삭제하는 쿼리
	@Query(value = "DELETE FROM comm_img WHERE comm_img_file_name = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

	// 커뮤니티 이미지 파일 경로 조회
	@Query(value = "SELECT comm_img_path FROM comm_img WHERE comm_no = :commNo", nativeQuery = true)
	List<String> selectImagePath(@Param("commNo") Integer comm_no);

	// 커뮤니티 글에 속한 모든 이미지를 삭제하는 쿼리
	@Query(value = "DELETE FROM comm_img WHERE comm_no = :commNo", nativeQuery = true)
	void deleteImageAll(@Param("commNo") Integer comm_no);

	 
}
