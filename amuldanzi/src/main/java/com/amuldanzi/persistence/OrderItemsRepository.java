package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.OrderItemsDTO;
import com.amuldanzi.entity.OrderItemsEntity2;

public interface OrderItemsRepository extends CrudRepository<OrderItemsDTO, Integer>{
	
	@Query(value = "SELECT oi.count count, oi.price price, oi.tracking_number trackingNumber, os.pay_date payDate, c.commerce_name commerceName, c.img img FROM order_items oi LEFT JOIN orders os ON oi.order_id = os.order_id LEFT JOIN commerce c ON oi.commerce_id = c.commerce_id WHERE os.order_status = '결제완료' and os.id = :id", nativeQuery = true)
	List<Object[]> orderOFindByMemberId(String id);
	
	@Query(value = "SELECT oi.count count, oi.price price, oi.tracking_number trackingNumber, os.pay_date payDate, c.commerce_name commerceName, c.img img FROM order_items oi LEFT JOIN orders os ON oi.order_id = os.order_id LEFT JOIN commerce c ON oi.commerce_id = c.commerce_id WHERE os.order_status = '취소완료' and os.id = :id", nativeQuery = true)
	List<Object[]> orderXFindByMemberId(String id);


}
