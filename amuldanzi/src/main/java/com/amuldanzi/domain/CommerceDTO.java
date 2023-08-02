package com.amuldanzi.domain;

import org.hibernate.annotations.DynamicInsert;

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
@Table(name="commerce")
@DynamicInsert
// 라이브커머스 상품
public class CommerceDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, updatable = false, insertable = false)
	private 	Integer 	commerceId;		// 상품 ID ( PK )
	
	
	private 	String 		commerceName;	// 상품명
	private 	Integer 	commercePrice;	// 상품 가격
	private 	Integer 	commerceStock;	// 상품 재고
	private 	String		img;
	private 	String		imgPath;
	private 	String		detailImg;
	private		String		detaiImgPath;	
	private 	Integer		commercePer;
	
	
}
