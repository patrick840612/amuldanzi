package com.amuldanzi.domain;

import lombok.Data;

@Data
public class User {
	private String uid;
	private String upw;
	private String uname;
	private Integer upoint;
	private String email;
	private String googleid;
	private String naverid;
	private String nickname;
}
