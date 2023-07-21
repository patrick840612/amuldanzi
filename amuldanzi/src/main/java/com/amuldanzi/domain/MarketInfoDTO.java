package com.amuldanzi.domain;
 
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "market")
public class MarketInfoDTO {
	
	// 마켓정보
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private 	Integer 	id;
	
	
	private 	String 		title;
	private 	String 		tel; 
	private 	String 		addr;
	private 	Double 		lat;
	private 	Double 		lng;
	private  	String 		time;
	 
	
	@Column(columnDefinition = "integer default 0" )
	private 	Integer 	count;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@JoinColumn(name="cateId")
	private BoardCategoryDTO boardCate;
	
}
