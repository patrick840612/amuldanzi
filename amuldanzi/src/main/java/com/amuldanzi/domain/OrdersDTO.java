package com.amuldanzi.domain;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="orders")
public class OrdersDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId;
	
	private Integer totalPrice;
	
	@Column(columnDefinition = "timestamp default DATE_FORMAT(now(), '%Y-%m-%d %H:%i:%s')"
			,insertable = false
			,updatable = false)
	private Timestamp payDate;
	
	@Column(columnDefinition = "varchar default 'order'"
			,insertable = false
			,updatable = false)
	private String orderStatus;
	
	private String oneId;
	
	private String shopId;
	
	private String cardNum;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="id")
	private MemberInfoDTO memberInfo;

}
