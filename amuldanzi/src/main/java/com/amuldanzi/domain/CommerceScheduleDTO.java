package com.amuldanzi.domain;

import java.util.Date;

import lombok.Data;

@Data
// 라이브커머스 일정관리
public class CommerceScheduleDTO {
	
	private 	Integer 	scheduleId;		// 일정관리 ID ( PK )		
	private 	String 		commerceStart;	// 방송 시작시간
	private 	String 		commerceEnd;	// 방송 종료시간
	private 	Date 	commerceDate;	// 방송 날짜
	

}
