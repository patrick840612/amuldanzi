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
@Table(name = "commerceSchedule")
// 라이브커머스 일정관리
public class CommerceScheduleDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, updatable = false, insertable = false)
	private 	Integer 	scheduleId;		// 일정관리 ID ( PK )
	
	private 	String 		commerceStart;	// 방송 시작시간
	private 	String 		commerceEnd;	// 방송 종료시간
	private 	Date 	    commerceDate;	// 방송 날짜
	

}
