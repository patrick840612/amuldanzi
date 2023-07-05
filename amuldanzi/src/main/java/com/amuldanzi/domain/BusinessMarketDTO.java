package com.amuldanzi.domain;

import lombok.Data;

@Data
// 사업자 마켓
public class BusinessMarketDTO {
	
	private 	String 		businessNumber;			// 사업자 등록번호 ( PK & FK )
	
	private 	String 		businessMarketName;		// 사업자 마켓 이름
	private 	String 		businessMarketContent;	// 사업자 마켓 설명
	private 	String 		businessMarketAddr;		// 오프라인 마켓 주소
	private 	String 		businessMarketLat;		// 오프라인 마켓 위도
	private 	String 		businessMarketLng;		// 오프라인 마켓 경도
	
}
