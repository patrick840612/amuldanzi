package com.amuldanzi.domain;

import lombok.Data;

@Data
// 라이브커머스 이벤트
public class CommerceEventDTO {
	
	private 	Integer 	eventId;	// 이벤트 ID ( PK )
	private 	String 		eventName;	// 이벤트 이름 
	private 	Integer 	eventPer;	// 할인율
}
