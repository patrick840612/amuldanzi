package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CommerceDTO;

public interface CommerceRepository extends CrudRepository<CommerceDTO, Integer>{
	
	@Query(value = "UPDATE commerce SET img = NULL WHERE img = :imageName", nativeQuery = true)
	void deleteImage(@Param("imageName") String imageName);

	@Query("SELECT m FROM CommerceDTO m ORDER BY m.commerceId DESC")
	List<CommerceDTO> getCommerceListRecent();

	@Query(value = "SELECT c " +
            "FROM CommerceDTO c " +
            "INNER JOIN OrderItemsDTO o ON c.commerceId = o.commerce.commerceId " +
            "GROUP BY c.commerceId " + 
            "ORDER BY o.price DESC " +
            "LIMIT 4")
	List<CommerceDTO> getCommerceAsc();

}
