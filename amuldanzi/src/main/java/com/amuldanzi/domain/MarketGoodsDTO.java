package com.amuldanzi.domain;

import java.util.Date;

import lombok.Data;

@Data
// 마켓 상품
public class MarketGoodsDTO {
	
	private 	Integer 	goodsId;		// 상품 ID ( PK )
	private 	String 		goodsName;		// 상품명(제목)
	private 	Integer 	goodsPrice;		// 상품 판매가격
	private 	String 		goodsContent;	// 상품 설명
	private 	String 		goodsQuality;	// 상품 상태 ( 초기값 : "new" | "reserved" | "soldout" )
	private 	Integer 	goodsCount;		// 조회수
	private 	Date 		goodsDate;		// 생성 일자
	
	private 	String 		id;				// 회원(판매자) ID ( FK )
	private 	Integer 	cateId;			// 카테고리 ID ( FK )

}
