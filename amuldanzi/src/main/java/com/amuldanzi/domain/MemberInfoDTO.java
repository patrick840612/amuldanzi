package com.amuldanzi.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="memberInfo")
public class MemberInfoDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String 	id;
	private String 	userPassword;
	private String 	userEmail;
	private String 	userName;
	private String 	userTel;
	private String 	userAddr1;
	private String 	character;
	private boolean marketingOk;
	private String 	memberRole;
	
	private String 	userAddr2;
	private String 	lat;
	private String 	lng;
	private String 	social;

}
