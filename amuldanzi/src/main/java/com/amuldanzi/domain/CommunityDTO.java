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
@Table(name = "community")
public class CommunityDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commNo;		// 글 번호 ( PK )
	
	private String id;			// 아이디 ( FK )
	
	private String commTilte;	// 글 제목
	private String commContent;	// 글 내용
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private Date commDate;		// 글 작성일자
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private Date answerDate;	// 댓글 작성일자
	
	@Column(columnDefinition = "integer default 0" )
	private Integer answerCount;// 댓글수
	

}
