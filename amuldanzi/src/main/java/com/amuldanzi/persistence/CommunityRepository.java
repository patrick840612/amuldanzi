package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommReplyDTO;
import com.amuldanzi.domain.CommunityDTO; 

public interface CommunityRepository  extends CrudRepository<CommunityDTO, Integer>{

	//모든 커뮤니티 글 목록을 조회하는 쿼리
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

	// 커뮤니티 글 번호로 커뮤니티 글을 조회하는 쿼리
	@Query(value = "SELECT * FROM community WHERE comm_no = :commNo", nativeQuery = true)
    CommunityDTO findByCommNo(@Param("commNo") Integer commNo);

	// 글 번호를 기준으로 글의 제목, 내용을 수정하는 쿼리
	@Modifying
	@Query(value = "UPDATE community SET comm_title = :commTitle, comm_content = :commContent WHERE comm_no = :commNo", nativeQuery = true)
	void modifyCommunity(@Param("commNo") Integer comm_no, @Param("commTitle") String commTitle, @Param("commContent") String commContent);

	// 해당 글번호에 맞는 커뮤니티 게시글 삭제 하는 쿼리
	@Query(value = "DELETE FROM community WHERE comm_no = :commNo", nativeQuery = true)
	void deleteCommunity(@Param("commNo") Integer comm_no);

	// 해당 글번호를 기준으로 커뮤니티 글 조회 하는 쿼리
    @Query(value = "SELECT * FROM community WHERE comm_no = :commNo", nativeQuery = true)
	CommunityDTO getCommunityByCommNo(String commNo);

    // 해당 글번호를 기준으로 댓글 입력하는 쿼리
    @Query(value = "INSERT INTO reply (comm_no, id, reply_content) VALUES (?1, ?2, ?3)", nativeQuery = true)
	void saveReply(String commNo, String memberId, String replyContent);

    // 해당 글번호를 기준으로 달린 댓글 리스트 불러오기 
    @Query(value = "SELECT r.reply_content, r.reply_date, r.id, r.reply_no, r.comm_no  FROM reply r WHERE comm_no = :commNo", nativeQuery = true)
	List<Object[]> replyList(String commNo);

	// 해당 댓글 번호를 기준으로 댓글 내용 불러오기 
	@Query(value= "SELECT * FROM reply r WHERE reply_no = :replyNo", nativeQuery=true)
	CommReplyDTO getReplyNo(String replyNo); 
	
	// 해당 글번호와 댓글 번호를 기준으로 두개의 조건에 맞는 댓글 삭제
	@Modifying
	@Query(value = "DELETE FROM reply WHERE comm_no = :commNo AND reply_no = :replyNo" , nativeQuery=true)
	void deleteReply(String commNo, String replyNo);

	// 댓글수 반환하는 쿼리
	@Query(value = "SELECT COUNT(*) FROM reply WHERE comm_no = :commNo", nativeQuery=true)
	Integer getreplyLikeCount(Integer commNo);

	@Query(value = "SELECT c.id AS id, c.comm_title AS title, c.comm_date AS date , l.like_count AS likeCount, i.comm_img_file_name AS path, c.comm_no AS commNo  "
            + "FROM community c "
            + "LEFT JOIN ( "
            + "    SELECT comm_no, COUNT(*) AS like_count "
            + "    FROM cm_like "
            + "    GROUP BY comm_no "
            + ") l ON c.comm_no = l.comm_no "
            + "LEFT JOIN comm_img i ON c.comm_no = i.comm_no "
            + "ORDER BY l.like_count DESC LIMIT 3 ", nativeQuery = true)
	List<Object[]> selectLikeCommunityList();
  
}
