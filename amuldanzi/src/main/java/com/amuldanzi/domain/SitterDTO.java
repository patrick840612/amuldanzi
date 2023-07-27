package com.amuldanzi.domain;

import java.util.Date;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
