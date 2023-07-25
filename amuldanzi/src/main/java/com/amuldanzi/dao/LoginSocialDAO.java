package com.amuldanzi.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;

public interface LoginSocialDAO extends CrudRepository<MemberSocialDTO, String>
{
    @Query(value = "SELECT id FROM member_social WHERE social = :#{#member.social} AND social_key = :#{#member.socialKey}", nativeQuery = true)
    String sRegistCheck(MemberSocialDTO member);

	@Query(value = "SELECT * FROM member_social WHERE id = :#{#member.id}", nativeQuery = true)
	List<MemberSocialDTO> selectSocialById(MemberInfoDTO member);
    
	@Query(value = "DELETE FROM member_social WHERE id = :#{#member.memberId.id} AND social = :#{#member.social}", nativeQuery = true)
    void deleteByMemberId(MemberSocialDTO member);
	
}
