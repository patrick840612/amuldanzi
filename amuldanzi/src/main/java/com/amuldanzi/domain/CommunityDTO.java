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
@Table(name = "community") // 커뮤니티
@DynamicInsert
public class CommunityDTO {

	
	// 커뮤니티 글번호 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = true, updatable = false, insertable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Integer commNo;
	
	// 회원정보 id 외부키
	@ManyToOne(optional = false, fetch = FetchType.LAZY) 
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	
	// 글 제목
	private String commTitle; 
	
	// 글 내용 
	@Column(length = 6000)
	private String commContent;
	
	// 게시글 일시
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date commDate; 
	
	// 댓글 수 
	@Column(columnDefinition = "integer default 0")
	private Integer answerCount;
	
}
