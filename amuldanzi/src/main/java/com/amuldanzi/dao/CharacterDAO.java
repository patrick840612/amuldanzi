package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.CharacterDTO;

public interface CharacterDAO extends CrudRepository<CharacterDTO, Integer>
{
	@Query(value = "SELECT * FROM character_img WHERE id = :id", nativeQuery = true)
	List<CharacterDTO> selectByMemberId(String id);
}
