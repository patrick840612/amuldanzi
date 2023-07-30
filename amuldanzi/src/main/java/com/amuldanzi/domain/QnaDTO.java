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
import lombok.Data;

@Data
//@Entity
@Table(name = "qna")
@DynamicInsert
public class QnaDTO {

	@Id // pk 지정
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(nullable = false, updatable = false, insertable = false)
	private Integer qnaNo;
	
	private String qnaCategory; // 문의유형 시스템, 나의 반려동물, 마켓, 게시판, 커뮤니티
	private String qnaTitle;
	@Column(length = 6000)
	private String qnaContent;
	
	@Column(columnDefinition = "date default sysdate()", insertable = false, updatable = true)
	private Date qnaDate; 

	@Column(length = 6000)
	private String qnaAnswer;
	//private String qnaAnswerWriter; // 작성자 필요한지(빼고싶음)
	@Column(columnDefinition = "date default sysdate()", insertable = false, updatable = true)
	private Date qnaAnswerDate; // 답변일자
	// 있었으면 좋겠음 ㅋㅋㅋ private String qnaAnswerOk; // 답변여부 : '답변대기','답변완료'
	
	private String qnaImg;
	private String qnaImgPath;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	

}
