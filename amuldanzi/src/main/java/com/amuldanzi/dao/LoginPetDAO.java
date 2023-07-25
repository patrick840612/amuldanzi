package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;

public interface LoginPetDAO extends CrudRepository<MemberPetDTO, Integer>
{

	@Query(value = "SELECT * FROM member_pet WHERE id = :#{#member.id}", nativeQuery = true)
	List<MemberPetDTO> selectbyId(MemberInfoDTO member);
	
}
