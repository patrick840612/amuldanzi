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
@Entity
@Table(name = "jungoLike")// 좋아요 
@DynamicInsert
public class JungoLikeDTO {

	// 좋아요 id
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false, updatable = false, insertable = false)
	private Integer likeId;

	// 중고마켓 번호 외부키
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "goodsId", referencedColumnName = "goodsId")
	private MarketGoodsDTO MarketGoods;

	// 회원정보 id 외부키
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "id", referencedColumnName = "id")
	private MemberInfoDTO memberId;

	// 좋아요 일시
	@Column(columnDefinition = "date default sysdate()", insertable = false, updatable = true)
	private Date likeDate;
}
