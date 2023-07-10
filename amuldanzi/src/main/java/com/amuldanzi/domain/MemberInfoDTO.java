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
	private String 	id="";
	private String 	userPassword="";
	private String 	userEmail="";
	private String 	userName="";
	private String 	userTel="";
	private String 	userAddr="";
	private String 	characterImg="";
	@Column(columnDefinition = "TINYINT(1)")
	private boolean	marketingOk=true;
	private String 	memberRole="";

	private String 	social="";
	private String 	sido="";

}
