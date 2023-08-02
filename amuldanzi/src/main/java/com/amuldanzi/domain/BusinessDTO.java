package com.amuldanzi.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "business")
public class BusinessDTO {

	@Id
	@Column(nullable = true, updatable = false, insertable = false)
	private String businessNumber; // 사업자등록번호 없을 시 주민번호

	private String businessTitle;  // '사업자 역할신청'
	private String businessName; // 상호명 없을 시 대표자명
	private String businessSector;  // 업종
	private String businessOk; // 승인여부 : '승인대기','승인완료'
	
	private String businessImg;
	private String businessImgPath;
	
	@Column(columnDefinition = "date default sysdate()", insertable = false, updatable = true)
	private Date businessRegdate; 
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;

}
