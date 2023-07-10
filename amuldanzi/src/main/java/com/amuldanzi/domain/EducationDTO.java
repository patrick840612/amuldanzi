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
@Table(name = "education")
public class EducationDTO {

	// 교육정보
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eduId;

	
	private String eduAnimal;
	private String eduTitle;
	private String eduStep;
	private String eduContent;
	private String eduLevel;
	private String eduImg;
	private String eduImgPath;
	private String eduVideo;
	private String eduVideoPath;
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private Date eduRegDate;
	
	@Column(columnDefinition = "integer default 0" )
	private Integer eduCnt;	
	
	
}
