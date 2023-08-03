package com.amuldanzi.domain;

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
@Table(name = "cart")
public class CartDTO {
	
	// 장바구니
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartId;
	
	@Column(columnDefinition = "integer default 1")
	private 	Integer 	count;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="id")
	private MemberInfoDTO memberInfo;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="commerceId")
	private CommerceDTO commerce;

}
