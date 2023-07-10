package com.amuldanzi.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "care")
public class CareDTO {

	// 케어정보
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer careSeq;
	
	private 	String 		careAnimal;
	private 	String 		careTitle;
	private 	String 		careVideo;
	private 	String 		careVideoPath;
	private 	String 		careImg;
	private 	String 		careImgPath;
	private 	String 		careInfo;
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private 	Date 		careRegDate;
	
	
	
	@Column(columnDefinition = "integer default 0")
	private 	Integer 	careCnt;
	
}
