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
@Table(name = "reply")
@DynamicInsert
public class CommReplyDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer replyNo;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "commNo", referencedColumnName = "commNo")
	private CommunityDTO CommunityNum;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY) 
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId; 
	
	@Column(nullable = false, updatable = false, insertable = false)
	private String replyContent; 
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date replyDate;
	 
	
	
}
