package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;

public interface MemberRepository extends CrudRepository<MemberInfoDTO, String>{

	@Query("SELECT m FROM MemberInfoDTO m WHERE m.id = ?1")
	MemberInfoDTO findId(String memberId);

	 @Query(value = "SELECT * FROM member_info WHERE id = :commMemberId", nativeQuery = true)
	MemberInfoDTO getMemberId(String commMemberId);
}
