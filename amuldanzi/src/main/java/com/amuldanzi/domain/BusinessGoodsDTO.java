package com.amuldanzi.domain;

import lombok.Data;

@Data
// 사업자 상품
public class BusinessGoodsDTO {
	
	private 	Integer 	businessGoodsId;		// 사업자 상품 ID ( PK )
	private 	String 		businessGoodsName;		// 상품명
	private 	Integer 	businessGoodsPrice;		// 상품 판매가격
	private 	String 		businessGoodsContent;	// 상품 설명
	
	private 	String 		businessNumber;			// 사업자 등록번호 ( FK )
	
}
