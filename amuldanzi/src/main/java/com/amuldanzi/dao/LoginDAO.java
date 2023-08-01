package com.amuldanzi.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.CharacterDTO;
import com.amuldanzi.domain.MemberInfoDTO;

public interface LoginDAO extends CrudRepository<MemberInfoDTO, String>
{
    @Query(value = "SELECT id FROM member_info WHERE user_email = :#{#member.userEmail} AND social = :#{#member.social}", nativeQuery = true)
    String sLoginCheck(MemberInfoDTO member);
	
	@Query(value = "SELECT user_password FROM member_info WHERE id = :id", nativeQuery = true)
	String loginCheck(String id);
	
	@Query(value = "SELECT * FROM member_info WHERE user_email = :userEmail", nativeQuery = true)
	Optional<MemberInfoDTO> findByUserEmail(String userEmail);
	
	@Query(value = "SELECT * FROM member_info WHERE user_tel = :userTel", nativeQuery = true)
	Optional<MemberInfoDTO> findByUserTel(String userTel);
	
	@Query(value = "UPDATE member_info SET user_password = :#{#member.userPassword} WHERE id = :#{#member.id}", nativeQuery = true)
	void changePassword(MemberInfoDTO member);
	
	@Query(value = "UPDATE member_info SET user_email = :#{#member.userEmail}, user_name = :#{#member.userName}, user_tel = :#{#member.userTel}, "
			+ "user_addr = :#{#member.userAddr}, marketing_ok = :#{#member.marketingOk}, member_role = :#{#member.memberRole}, "
			+ "sido = :#{#member.sido}, sigungu = :#{#member.sigungu}, blood_give = :#{#member.bloodGive}, blood_message = :#{#member.bloodMessage}, "
			+ "blood_tel = :#{#member.bloodTel} WHERE id = :#{#member.id}", nativeQuery = true)
	void updateById(MemberInfoDTO member);
	
	@Query(value = "UPDATE member_info SET blood_give = :#{#member.bloodGive} WHERE id = :#{#member.id}", nativeQuery = true)
	void changBloodGive(MemberInfoDTO member);
	
	@Query(value = "UPDATE member_info SET cpoint = :#{#member.cpoint} WHERE id = :#{#member.id}", nativeQuery = true)
	void cpointupdate(MemberInfoDTO member);
	
	@Query(value = "UPDATE member_info SET cpoint = :#{#member.cpoint} WHERE id = :#{#member.id}", nativeQuery = true)
	void cpointminus(MemberInfoDTO member);
}
