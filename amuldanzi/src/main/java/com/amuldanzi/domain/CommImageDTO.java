package com.amuldanzi.domain;

import java.util.Date;

import org.antlr.v4.runtime.misc.NotNull;
import org.hibernate.annotations.DynamicInsert;

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
@Table(name = "commImg")
@DynamicInsert
public class CommImageDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer emiId;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "commNo", referencedColumnName = "commNo")
	private CommunityDTO CommunityNum;
	
	@Column(nullable = false) 
	private String commImgOriginName;
	
	@Column(nullable = false)
	private String commImgFileName;
	
	@Column(nullable = false)
	private String commImgPath;
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date commImgdate;
	
}
