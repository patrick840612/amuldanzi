package com.amuldanzi.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.MemberInfoDTO;

public interface LoginDAO extends CrudRepository<MemberInfoDTO, String>
{
    @Query(value = "SELECT id FROM member_info WHERE user_email = :#{#member.userEmail} AND social = :#{#member.social}", nativeQuery = true)
    String sLoginCheck(MemberInfoDTO member);
	
	@Query(value = "SELECT user_password FROM member_info WHERE id = :id", nativeQuery = true)
	String loginCheck(String id);
}
