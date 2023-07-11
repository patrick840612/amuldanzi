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
// 관심 상품
@Entity
@Table(name="advertisement")
public class AdvertisementDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private		Integer		id;		//광고 번호 pk
	
	
	private		String		title;		//광고 이름(제목)  	not null
	private		String		url;		//광고 링크
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private		Date		regdate;	//광고 등록일	 	not null
	
	private		String		img;		//광고 이미지
	private		String		imgPath;	//광고 이미지 패스
	
}
