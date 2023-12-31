package com.amuldanzi.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name="orderItems")
public class OrderItemsDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemId;
	
	private Integer count;
	
	private Integer price;
	
	private String trackingNumber;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="commerceId")
	private CommerceDTO commerce;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="orderId")
	private OrdersDTO orders;
	
}
