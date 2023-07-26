package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;

public interface LoginPetDAO extends CrudRepository<MemberPetDTO, Integer>
{

	@Query(value = "SELECT * FROM member_pet WHERE id = :#{#member.id}", nativeQuery = true)
	List<MemberPetDTO> selectbyId(MemberInfoDTO member);
	
	@Query(value = "UPDATE member_pet SET pet_name = :#{#pet.petName}, which_pet = :#{#pet.whichPet}, pet_blood = :#{#pet.petBlood}, gps = :#{#pet.gps} WHERE member_pet_id = :#{#pet.memberPetId}", nativeQuery = true)
	void updatePet(MemberPetDTO pet);
	
    @Query(value = "DELETE FROM member_pet WHERE id = :#{#member.id}", nativeQuery = true)
    void petDel(MemberInfoDTO member);

    @Query(value = "DELETE FROM member_pet WHERE member_pet_id = :memberPetId", nativeQuery = true)
    void deletePet(Integer memberPetId);
    
	
}
