package com.amuldanzi.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.JwtDTO;

public interface LoginJwtDAO extends CrudRepository<JwtDTO, Long>
{

	@Query(value = "DELETE FROM jwt WHERE access_token = :access_token", nativeQuery = true)
	void setJwtStateDiscard(String access_token);
	
	@Query(value = "SELECT refresh_token FROM jwt WHERE access_token = :access_token", nativeQuery = true)
	String selectRefreshByAccess(String access_token);
	
	@Query(value = "SELECT refresh_token_valid FROM jwt WHERE refresh_token = :refresh_token", nativeQuery = true)
	JwtDTO selectExpiration(String refresh_token);

}
