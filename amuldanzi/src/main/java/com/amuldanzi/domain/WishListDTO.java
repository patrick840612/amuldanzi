package com.amuldanzi.domain;

import java.util.Date;

import lombok.Data;

@Data
// 관심 상품
public class WishListDTO {
	
	private 	Integer 	wishListId;		// 관심 상품 ID ( PK )
	private 	Date 		wishDate;		// 생성 일자
	
	private 	Integer 	goodsId;		// 마켓상품 ID ( FK )
	private 	String 		id;				// 회원정보 아이디 ( FK )
	
}
