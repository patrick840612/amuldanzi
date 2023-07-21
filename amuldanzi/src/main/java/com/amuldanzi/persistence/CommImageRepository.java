package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommImageDTO;

public interface CommImageRepository extends CrudRepository<CommImageDTO, Integer>{

	@Query(value = "SELECT comm_img_file_name FROM comm_img ci WHERE comm_no = ?1", nativeQuery = true)
	List<String> findByCommNo(Integer comm_no);

	@Query(value = "DELETE FROM comm_img WHERE comm_img_file_name = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

	@Query(value = "SELECT comm_img_path FROM comm_img WHERE comm_no = :commNo", nativeQuery = true)
	List<String> selectImagePath(@Param("commNo") Integer comm_no);

	@Query(value = "DELETE FROM comm_img WHERE comm_no = :commNo", nativeQuery = true)
	void deleteImageAll(@Param("commNo") Integer comm_no);

	 
}
