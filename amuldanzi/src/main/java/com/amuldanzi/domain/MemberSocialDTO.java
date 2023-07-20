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
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "memberSocial")
public class MemberSocialDTO {

	@Id // pk 지정
	@Column(nullable = false, updatable = false, insertable = false)
	private String socialKey;
	
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name="id", referencedColumnName = "id")
	private MemberInfoDTO memberId;
	
	private String social;
	
}
