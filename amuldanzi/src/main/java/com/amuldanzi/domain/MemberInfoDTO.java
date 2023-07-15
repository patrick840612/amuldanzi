package com.amuldanzi.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="memberInfo")
public class MemberInfoDTO {

	@Id
	private String 	id;
	@Column(nullable = false)
	private String 	userPassword;
	@Column(nullable = false)
	private String 	userEmail;
	@Column(nullable = true)
	private String 	userName;
	@Column(nullable = true)
	private String 	userTel;
	@Column(nullable = true)
	private String 	userAddr;
	@Column(nullable = true, updatable = false, insertable = false, columnDefinition = "varchar(255) default 'dog.jpg'")
	private String 	characterImg;
	@Column(updatable = true, insertable = true, columnDefinition = "TINYINT(1)") 
	private boolean	marketingOk;
	@Column(nullable = true)
	private String 	memberRole;
	@Column(nullable = true)
	private String 	sido;
	@Column(nullable = true)
	private String 	sigungu;
	@Column(updatable = true, insertable = true, columnDefinition = "TINYINT(1)")
	private boolean bloodGive;
	private String bloodMessage;
	private String bloodTel;
	
	@Column(nullable = true)
	private String 	social;


}
