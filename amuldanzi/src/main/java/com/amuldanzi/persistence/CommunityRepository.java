package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommunityDTO; 

public interface CommunityRepository  extends CrudRepository<CommunityDTO, Integer>{

	@Query(value = "SELECT c.id, c.comm_title, c.comm_date, c.comm_content, c.answer_count, c.comm_no, i.comm_img_file_name\r\n"
			+ "FROM community c\r\n"
			+ "LEFT JOIN (\r\n"
			+ "  SELECT comm_no, MIN(emi_id) AS min_emi_id\r\n"
			+ "  FROM comm_img\r\n"
			+ "  GROUP BY comm_no\r\n"
			+ ") min_img ON c.comm_no = min_img.comm_no\r\n"
			+ "LEFT JOIN comm_img i ON c.comm_no = i.comm_no AND i.emi_id = min_img.min_emi_id",
	        nativeQuery = true)
	List<Object[]>selectCommunityList();

	@Query(value = "SELECT * FROM community WHERE comm_no = :commNo", nativeQuery = true)
    CommunityDTO findByCommNo(@Param("commNo") Integer commNo);

	@Modifying
	@Query(value = "UPDATE community SET comm_title = :commTitle, comm_content = :commContent WHERE comm_no = :commNo", nativeQuery = true)
	void modifyCommunity(@Param("commNo") Integer comm_no, @Param("commTitle") String commTitle, @Param("commContent") String commContent);

	@Query(value = "DELETE FROM community WHERE comm_no = :commNo", nativeQuery = true)
	void deleteCommunity(@Param("commNo") Integer comm_no);

}
