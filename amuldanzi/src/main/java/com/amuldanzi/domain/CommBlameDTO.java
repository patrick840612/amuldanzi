package com.amuldanzi.domain;

import java.util.Date;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

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
@Table(name = "cmBlame")
@DynamicInsert // insert 쿼리 자동 생성시 사용
public class CommBlameDTO {

	// 신고 id 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false, updatable = false, insertable = false)
	private Integer blameId;
		
	// 커뮤니티 글 번호에 해당하는 외부키, 신고글 삭제시 외부키 무시 후 삭제하기위해 OnDelete
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "commNo", referencedColumnName = "commNo")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private CommunityDTO CommunityNum;
	
	// 회원 정보 외부키
	@ManyToOne(optional = false, fetch = FetchType.LAZY) 
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	
	// 신고 날짜
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date blameDate;
	
}
