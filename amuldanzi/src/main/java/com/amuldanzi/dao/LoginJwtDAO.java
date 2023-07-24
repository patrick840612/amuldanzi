package com.amuldanzi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.JwtDTO;

public interface LoginJwtDAO extends CrudRepository<JwtDTO, String>
{

	@Query(value = "DELETE FROM jwt WHERE access_token = :access_token", nativeQuery = true)
	void setJwtStateDiscard(String access_token);
	
	@Query(value = "SELECT refresh_token FROM jwt WHERE access_token = :access_token", nativeQuery = true)
	String selectRefreshByAccess(String access_token);
	
	@Query(value = "SELECT * FROM jwt WHERE refresh_token = :refresh_token", nativeQuery = true)
	JwtDTO selectExpiration(String refresh_token);
	
	@Query(value = "INSERT INTO jwt(access_token, refresh_token, access_token_valid, refresh_token_valid) VALUES (:#{#jwt.access_token}, :#{#jwt.refresh_token}, :#{#jwt.access_token_valid}, :#{#jwt.refresh_token_valid})", nativeQuery = true)	
	void recreatjwt(JwtDTO jwt);

	@Query(value = "SELECT * FROM jwt", nativeQuery = true)	
	List<JwtDTO> findAll();
}
