package com.amuldanzi.domain;

import lombok.Data;

@Data
public class MemberInfoDTO {

	private String 	id;
	private String 	userPassword;
	private String 	userEmail;
	private String 	userName;
	private String 	userTel;
	private String 	userAddr;
	private String 	character;
	private boolean marketingOk;
	private String 	memberRole;
}
