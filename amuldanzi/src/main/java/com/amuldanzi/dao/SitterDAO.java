package com.amuldanzi.dao;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.SitterDTO;

public interface SitterDAO extends CrudRepository<SitterDTO, String>
{

	
}
