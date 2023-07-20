package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommLikeDTO;

public interface CommLikeRepository extends CrudRepository<CommLikeDTO, Integer>{

	//@Query(value = "SELECT COUNT(*) FROM cmLike WHERE commNo = :commNo", nativeQuery = true)
	//Integer countByCommunityNum(Integer commNo);

	 @Modifying
	 @Query(value = "INSERT INTO cm_like (like_date, comm_no, id) " +
		        "SELECT sysdate(), :commNo, :commMemberId " +
		        "FROM dual " +
		        "WHERE NOT EXISTS " +
		        "(SELECT 1 FROM cm_like WHERE id = :commMemberId AND comm_no = :commNo)", nativeQuery = true)
	 Integer saveLike(String commNo, String commMemberId);

	 
	 @Query(value = "SELECT COUNT(*) FROM cm_like WHERE comm_no = :commNo", nativeQuery = true)
	 Integer getCommLikeCount(Integer commNo);

	 @Modifying
	 @Query(value = "DELETE FROM cm_like WHERE comm_no = :commNo", nativeQuery = true)
	 void deleteByCommunity(@Param("commNo") Integer commNo);

	 @Modifying
	 @Query(value = "DELETE FROM cm_like WHERE comm_no = :commNo AND id = :commMemberId" , nativeQuery = true)
	 void deleteCommUnlike(String commNo, String commMemberId);

	
	 @Modifying
	 @Query(value = "INSERT INTO cm_blame (blame_date, comm_no, id) " +
		        "SELECT sysdate(), :commNo, :commMemberId " +
		        "FROM dual " +
		        "WHERE NOT EXISTS " +
		        "(SELECT 1 FROM cm_blame WHERE id = :commMemberId AND comm_no = :commNo)", nativeQuery = true)
	 Integer saveBlame(String commNo, String commMemberId);

	 @Modifying
	 @Query(value = "DELETE FROM cm_blame WHERE comm_no = :commNo AND id = :commMemberId" , nativeQuery = true)
	 void deleteCommUnblame(String commNo, String commMemberId);

	 @Modifying
	 @Query(value = "DELETE FROM cm_blame WHERE comm_no = :commNo", nativeQuery = true)
	 void deleteByBlame(@Param("commNo") Integer comm_no);

	 @Query(value = "SELECT COUNT(*) FROM cm_blame WHERE comm_no = :commNo", nativeQuery = true)
	 Integer getCommBlameCount(Integer commNo);
	

	 
}
