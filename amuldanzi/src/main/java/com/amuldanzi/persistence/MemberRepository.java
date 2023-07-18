package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;

public interface MemberRepository extends CrudRepository<MemberInfoDTO, Integer>{

	@Query("SELECT m FROM MemberInfoDTO m WHERE m.id = ?1")
	MemberInfoDTO findId(String memberId);
}
