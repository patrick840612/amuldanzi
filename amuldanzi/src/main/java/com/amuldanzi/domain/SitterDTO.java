package com.amuldanzi.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "sitter")
public class SitterDTO {

	@Id
	@Column(nullable = true, updatable = false, insertable = false)
	private String id;

	@OneToOne(optional = false, fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private MemberInfoDTO memberId;
	
	private String sitter;
	private String sitterTitle;
	private String sitterCareer;
	private String sitterPetCareer;
	
	@Column(length = 6000)
	private String sitterEtc;

	private String sitterImg;
	private String sitterImgPath;
	
	private String sitterLicense;
	private String sitterAuthority;
	
	@Column(columnDefinition = "date default sysdate()", insertable = false, updatable = true)
	private Date sitterRegdate; 
	

}
