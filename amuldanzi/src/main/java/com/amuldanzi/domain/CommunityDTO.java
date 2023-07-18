package com.amuldanzi.domain;

import java.util.Date;

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
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name = "community")
@DynamicInsert
public class CommunityDTO {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, updatable = false, insertable = false)
	private Integer commNo;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY) 
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	
	private String commTitle; 
	
	@Column(length = 6000)
	private String commContent;
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date commDate;
	 
	@Transient
	private Integer likeCount;
	
	@Column(columnDefinition = "integer default 0")
	private Integer answerCount;
	
}
