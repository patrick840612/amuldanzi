package com.amuldanzi.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name="memberInfo")
public class MemberInfoDTO {

	@Id
	private String 	id;
	@Column(nullable = false)
	private String 	userPassword;
	private String 	userEmail;
	private String 	userName;
	@Column(nullable = false, unique = true)
	private String 	userTel;
	private String 	userAddr;
	@Column(nullable = true, updatable = true, insertable = true, columnDefinition = "varchar(255) default 'cat.png'")
	private String 	selectCharacter;
	@Column(updatable = true, insertable = true, columnDefinition = "TINYINT(1)") 
	private boolean	marketingOk;
	@Column(nullable = false)
	private String 	memberRole;
	private String 	sido;
	private String 	sigungu;
	@Column(updatable = true, insertable = true, columnDefinition = "TINYINT(1)")
	private boolean bloodGive;
	private String bloodMessage;
	private String bloodTel;
	private Integer cpoint;
}
