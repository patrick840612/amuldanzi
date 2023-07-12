package com.amuldanzi.domain;

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
@Table(name = "memberPet")
@DynamicInsert
public class MapDTO {


	@Id // pk 지정
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(nullable = false, updatable = false, insertable = false)
	private Integer memberPetId;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	
	private String whichPet;
	private String petBlood;
	@Column(updatable = false, insertable = false, columnDefinition = "TINYINT(1) default 1")
	private boolean bloodGive;
	private String bloodMessage;
	private String gps;
	
	
	
}
