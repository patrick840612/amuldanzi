package com.amuldanzi.domain;

import java.util.Date;

import org.hibernate.annotations.DynamicInsert;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "jwt")
@DynamicInsert
public class JwtDTO {
	
	@Id // pk 지정
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(nullable = false, updatable = false, insertable = false)
	private Long jwtno;
	
	private String access_token;
	private String refresh_token;
	private Date access_token_valid; 
	private Date refresh_token_valid; // 유효기한
	
}
