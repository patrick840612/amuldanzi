package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommLikeDTO;

public interface CommLikeRepository extends CrudRepository<CommLikeDTO, Integer>{

	//@Query(value = "SELECT COUNT(*) FROM cmLike WHERE commNo = :commNo", nativeQuery = true)
	//Integer countByCommunityNum(Integer commNo);

	 //해당 커뮤니티 글에 해당하는 좋아요 정보 저장
	 @Modifying
	 @Query(value = "INSERT INTO cm_like (like_date, comm_no, id) " +
		        "SELECT sysdate(), :commNo, :commMemberId " +
		        "FROM dual " +
		        "WHERE NOT EXISTS " +
		        "(SELECT 1 FROM cm_like WHERE id = :commMemberId AND comm_no = :commNo)", nativeQuery = true)
	 Integer saveLike(String commNo, String commMemberId);

	 
	 // 좋아요 수 반환하는 쿼리
	 @Query(value = "SELECT COUNT(*) FROM cm_like WHERE comm_no = :commNo", nativeQuery = true)
	 Integer getCommLikeCount(Integer commNo);

	 // 해당 커뮤니티 글 번호에 해당하는 좋아요 정보 삭제
	 @Modifying
	 @Query(value = "DELETE FROM cm_like WHERE comm_no = :commNo", nativeQuery = true)
	 void deleteByCommunity(@Param("commNo") Integer commNo);

	 // 해당 커뮤니티 글 번호에 해당하는 정보중 특정회원의 좋아요 삭제
	 @Modifying
	 @Query(value = "DELETE FROM cm_like WHERE comm_no = :commNo AND id = :commMemberId" , nativeQuery = true)
	 void deleteCommUnlike(String commNo, String commMemberId);

	 // 해당 커뮤니티 글번호에 해당하는 신고 정보를 저장하는 쿼리
	 @Modifying
	 @Query(value = "INSERT INTO cm_blame (blame_date, comm_no, id) " +
		        "SELECT sysdate(), :commNo, :commMemberId " +
		        "FROM dual " +
		        "WHERE NOT EXISTS " +
		        "(SELECT 1 FROM cm_blame WHERE id = :commMemberId AND comm_no = :commNo)", nativeQuery = true)
	 Integer saveBlame(String commNo, String commMemberId);

	 // 게시글 번호에 해당하는 신고 정보중 특정 회원의 신고 삭제 쿼리 
	 @Modifying
	 @Query(value = "DELETE FROM cm_blame WHERE comm_no = :commNo AND id = :commMemberId" , nativeQuery = true)
	 void deleteCommUnblame(String commNo, String commMemberId);

	 // 게시글 번호에 해당하는 신고 정보 삭제 
	 @Modifying
	 @Query(value = "DELETE FROM cm_blame WHERE comm_no = :commNo", nativeQuery = true)
	 void deleteByBlame(@Param("commNo") Integer comm_no);

	 // 게시글 번호에 해당하는 신고 갯수 반환
	 @Query(value = "SELECT COUNT(*) FROM cm_blame WHERE comm_no = :commNo", nativeQuery = true)
	 Integer getCommBlameCount(Integer commNo);
	

	 
}
