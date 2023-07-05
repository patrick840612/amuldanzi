package com.amuldanzi.domain;

import java.util.Date;

import lombok.Data;

@Data
// 사업자 게시판 리뷰
public class BusinessReviewDTO {

	private 	Integer 	businessReviewId;		// 사업자 게시판 리뷰 ID ( PK )
	private 	String 		businessReviewMessage;	// 리뷰 메세지
	private 	Date 		businessReviewDate;		// 리뷰 생성일자
	
	private 	String 		id;						// 회원 정보		( FK )
	private 	Integer 	businessGoodsId;		// 사업자 상품 ID 	( FK )
	
}
