package com.amuldanzi.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "commerceEvent")
// 라이브커머스 이벤트
public class CommerceEventDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, updatable = false, insertable = false)
	private 	Integer 	eventId;	// 이벤트 ID ( PK )
	
	private 	String 		eventName;	// 이벤트 이름 
	private 	Integer 	eventPer;	// 할인율
}
