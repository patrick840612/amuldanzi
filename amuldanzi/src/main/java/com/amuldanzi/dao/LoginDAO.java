package com.amuldanzi.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;

public interface LoginDAO extends CrudRepository<MemberInfoDTO, String>
{
	@Query(value = "SELECT id FROM member_info WHERE user_email = :userEmail AND social = :social", nativeQuery = true)
//	@Query(value = "SELECT id FROM memberInfo WHERE userEmail = :userEmail AND social = :social", nativeQuery = true)
    String sLoginCheck(MemberInfoDTO member);
	
	@Query(value = "SELECT user_password FROM member_info WHERE id = :id", nativeQuery = true)
//	@Query(value = "SELECT userPassword FROM memberInfo WHERE id = :id", nativeQuery = true)
	String loginCheck(MemberInfoDTO member);
}
