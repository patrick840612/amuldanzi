package com.amuldanzi.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="marketgoods")
// 마켓 상품
public class MarketGoodsDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private 	Integer 	goodsId;		// 상품 ID ( PK )
	private 	String 		goodsName;		// 상품명(제목)
	private 	Integer 	goodsPrice;		// 상품 판매가격
	private 	String 		goodsContent;	// 상품 설명
	
	private 	String 		goodsQuality;	// 상품 상태 ( 초기값 : "new" | "reserved" | "soldout" )
	
	@Column(columnDefinition = "integer default 0" )
	private 	Integer 	goodsCount;		// 조회수
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	private 	Date 		goodsDate;		// 생성 일자
	
	//private 	String 		id;				// 회원(판매자) ID ( FK )
	//private 	Integer 	cateId;			// 카테고리 ID ( FK )

}
