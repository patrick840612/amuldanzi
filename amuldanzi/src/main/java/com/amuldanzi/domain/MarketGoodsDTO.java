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
import jakarta.persistence.Transient;
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
	
	@Column(columnDefinition = "timestamp default DATE_FORMAT(now(), '%Y-%m-%d %H:%i:%s')"
			,insertable = false
			,updatable = false)
	private 	Timestamp		goodsDate;		// 생성 일자
	
	private		String		img;		//광고 이미지
	private		String		imgPath;	//광고 이미지 패스
	
	
	@Column(columnDefinition = "integer default 0"
	,insertable = false
	,updatable = false)
    private 	Long 		likesCount;  // 
	
	private 	String 		id;				// 회원(판매자) ID ( FK )
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="cateId")
	private 	MarketCategoryDTO 	marketCate;			// 카테고리 ID ( FK )

}
