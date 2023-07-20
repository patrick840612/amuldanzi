package com.amuldanzi.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberSocialDTO;

public interface LoginSocialDAO extends CrudRepository<MemberSocialDTO, String>
{
    @Query(value = "SELECT id FROM member_social WHERE social = :#{#member.social} AND social_key = :#{#member.socialKey}", nativeQuery = true)
    String sRegistCheck(MemberSocialDTO member);

}
