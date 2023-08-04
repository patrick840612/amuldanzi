package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.OrderItemsDTO;

public interface OrderItemsRepository extends CrudRepository<OrderItemsDTO, Integer>{

}
