package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.MemberPetDTO;

public interface MapRepository extends CrudRepository<MemberPetDTO, String>{
 
	// MapDTO에 저장되어있고 addr 을 포함한 검색결과 추출
	//@Query("SELECT new HashMap(mi.sido as sido, mi.userTel as userTel, m.whichPet as whichPet, m.petBlood as petBlood) FROM MapDTO m JOIN m.memberId mi WHERE mi.sido LIKE CONCAT('%', :sido, '%')")
	@Query(value = "SELECT mi.sido sido, mi.user_tel userTel, mp.which_pet whichPet, mp.pet_blood petBlood \r\n"
			+ "FROM member_info mi \r\n"
			+ "JOIN member_pet mp ON mi.id = mp.id WHERE mi.sido LIKE CONCAT('%', :sido, '%')", nativeQuery = true)
	List<Object[]> findByLocation(@Param("sido") String sido);
}
