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
@Table(name = "clinic")
public class ClinicDTO {

	
	// 병원정보
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private 	Integer 	clinicId;
	
	private 	String 		clinicName;
	private 	String 		clinicTel;
	private 	String 		clinicMajor;
	private 	String 		clinicAddr;
	private 	String 		clinicLat;
	private 	String 		clinicLng;
	private 	String 		clinicOpen;
	private 	String 		clinicClose;
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private 	Date 		clinicRegDate;
	
	@Column(columnDefinition = "integer default 0" )
	private  	Integer		clinicCnt;
	
}
