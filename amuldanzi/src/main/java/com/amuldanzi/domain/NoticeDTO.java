package com.amuldanzi.domain;

import java.time.LocalDate;
import java.util.Date;

import org.eclipse.jdt.internal.compiler.ast.FalseLiteral;

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
@Table(name="notice")
public class NoticeDTO {

	// 공지사항
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer noticeNo;
		
	private String noticeCategory;
	private String noticeTitle;
	private String noticeContent;
	
	
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = false)
	@Temporal(TemporalType.DATE)
	private Date noticeRegDate;
	
	@Column(columnDefinition = "integer default 0" )
	private Integer noticeCnt;
}
