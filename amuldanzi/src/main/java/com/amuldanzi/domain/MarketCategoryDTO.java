package com.amuldanzi.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="marketCategory")
// 마켓 카테고리
public class MarketCategoryDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private 	Integer 	cateId;		// 카테고리 ID ( PK )
	
	private 	String 		cateName;	// 카테고리 이름

}
