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
@Table(name = "reply") // 댓글
@DynamicInsert
public class CommReplyDTO {

	// 댓글 id
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer replyNo;
	
	// 커뮤니티 글 번호 외부키
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "commNo", referencedColumnName = "commNo")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private CommunityDTO CommunityNum;
	
	// 회원 id 외부키
	@ManyToOne(optional = false, fetch = FetchType.LAZY) 
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId; 
	
	// 댓글 내용
	@Column(nullable = false, updatable = false, insertable = false)
	private String replyContent; 
	
	// 댓글 일시 
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date replyDate;
	 
	
	
}
