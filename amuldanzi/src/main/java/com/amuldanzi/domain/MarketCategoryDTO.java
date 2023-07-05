package com.amuldanzi.domain;

import lombok.Data;

@Data
// 마켓 카테고리
public class MarketCategoryDTO {
	
	private 	Integer 	cateId;		// 카테고리 ID ( PK )
	private 	String 		cateName;	// 카테고리 이름

}
