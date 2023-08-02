package com.amuldanzi.domain;

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
@Table(name = "characterImg")
@DynamicInsert
public class CharacterDTO {
	
	@Id // pk 지정
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(nullable = false, updatable = false, insertable = false)
	private Integer characterNo;

	@Column(nullable = true, updatable = true, insertable = true, columnDefinition = "varchar(255) default 'cat.png'")
	private String characterImg;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	
}
