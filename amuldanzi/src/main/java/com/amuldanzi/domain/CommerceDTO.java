package com.amuldanzi.domain;

import lombok.Data;

@Data
// 라이브커머스 상품
public class CommerceDTO {
	
	private 	Integer 	commerceId;		// 상품 ID ( PK )
	private 	String 		commerceName;	// 상품명
	private 	Integer 	commercePrice;	// 상품 가격
	private 	Integer 	commerceStock;	// 상품 재고
	
	private 	Integer 	eventId;		// 이벤트 ID ( FK )
	private 	Integer 	scheduleId;		// 일정관리 ID ( FK )
}
