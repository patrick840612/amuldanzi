package com.amuldanzi.dao;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberPetDTO;

public interface LoginPetDAO extends CrudRepository<MemberPetDTO, Integer>
{

}
