package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.CharacterDTO;
import com.amuldanzi.domain.MemberInfoDTO;

public interface CharacterDAO extends CrudRepository<CharacterDTO, Integer>
{
	@Query(value = "SELECT * FROM character_img WHERE id = :id", nativeQuery = true)
	List<CharacterDTO> selectByMemberId(String id);
	
	@Query(value = "UPDATE character_img SET character_img = :#{#character.characterImg} WHERE character_no = :#{#character.characterNo}", nativeQuery = true)
	void evolveCharacter(CharacterDTO character);		
	
}
