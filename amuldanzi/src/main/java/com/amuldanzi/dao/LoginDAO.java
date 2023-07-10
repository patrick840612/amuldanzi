package com.amuldanzi.dao;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;

public interface LoginDAO extends CrudRepository<MemberInfoDTO, String>
{
	
}
