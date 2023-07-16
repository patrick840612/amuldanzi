package com.amuldanzi.domain;

import java.util.Date;

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
@Table(name = "community")

public class CommunityDTO {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String commNo;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	private String commTitle; 
	private String commContent;
	private Date commDate;
	private Date answerDate;
	private Integer answerCount;
	
}
