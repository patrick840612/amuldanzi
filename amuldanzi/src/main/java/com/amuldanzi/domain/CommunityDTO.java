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
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "community")
@DynamicInsert
public class CommunityDTO {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, updatable = false, insertable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
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
	
	@Column(columnDefinition = "integer default 0")
	private Integer answerCount;
	
}
