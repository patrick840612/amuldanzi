package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.OrdersDTO;

public interface OrdersRepository extends CrudRepository<OrdersDTO, Integer>{

}
