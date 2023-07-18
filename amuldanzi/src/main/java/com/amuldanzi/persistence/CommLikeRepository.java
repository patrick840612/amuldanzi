package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.CommLikeDTO;

public interface CommLikeRepository extends CrudRepository<CommLikeDTO, Integer>{

	@Query(value = "SELECT COUNT(*) FROM cmLike WHERE commNo = :commNo", nativeQuery = true)
	Integer countByCommunityNum(Integer commNo);

}
