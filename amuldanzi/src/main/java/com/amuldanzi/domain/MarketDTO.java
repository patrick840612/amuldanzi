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
@Table(name = "market")
public class MarketDTO {
	
	// 마켓정보
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private 	Integer 	marketId;
	
	
	private 	String 		marketName;
	private 	String 		marketTel;
	private 	String 		marketSale;
	private 	String 		marketAddr;
	private 	String 		marketLat;
	private 	String 		marketLng;
	private 	String 		marketOpen;
	private 	String 		marketClose;
	
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private Date noticeRegDate;
	
	@Column(columnDefinition = "integer default 0" )
	private 	Integer 	marketCnt;
	
}
