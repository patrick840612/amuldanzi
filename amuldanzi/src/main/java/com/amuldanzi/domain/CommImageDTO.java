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
@Table(name = "commImg")
@DynamicInsert
public class CommImageDTO {

	// 이미지 id 자동 증가수 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer emiId;
	
	// 커뮤니티 글 번호에 해당하는 외부키, 게시글 삭제시 외부키 무시 후 삭제하기위해 OnDelete
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "commNo", referencedColumnName = "commNo")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private CommunityDTO CommunityNum;
	
	// 원래의 사진이름 
	@Column(nullable = false) 
	private String commImgOriginName;
	
	// 사진 이름이 겹치지 않게 랜덤으로 바꿀 사진의 이름ㄴ
	@Column(nullable = false)
	private String commImgFileName;
	
	// 사진이 저장되는 경로 
	@Column(nullable = false)
	private String commImgPath;
	
	// 사진 저장 날짜 
	@Column(columnDefinition = "date default sysdate()"
			,insertable = false
			,updatable = true)
	private Date commImgdate;
	
}
