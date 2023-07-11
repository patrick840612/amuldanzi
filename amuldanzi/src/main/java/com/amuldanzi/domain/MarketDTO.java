package com.amuldanzi.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
	private 	Integer 	id;
	
	
	private 	String 		title;
	private 	String 		tel;
	private 	String 		sale;
	private 	String 		addr;
	private 	String 		lat;
	private 	String 		lng;
	private 	String 		open;
	private 	String 		close;
	
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private Date regdate;
	
	@Column(columnDefinition = "integer default 0" )
	private 	Integer 	count;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="cateId")
	private BoardCategoryDTO boardCate;
	
}
