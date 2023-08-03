package com.amuldanzi.persistence;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.CartDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.MemberInfoDTO;

import jakarta.transaction.Transactional;

public interface CartRepository extends CrudRepository<CartDTO, Integer>{
	
	Optional<CartDTO> findByMemberInfoAndCommerce(MemberInfoDTO memberInfo, CommerceDTO commerce);
	
	
	List<CartDTO> findByMemberInfo_Id(Object id);

	@Modifying
    @Transactional
    @Query("delete from CartDTO c where c.id = :cartId and c.memberInfo.id = :userId")
    void cartDelete(@Param("cartId") int cartId, @Param("userId") String userId);
}
