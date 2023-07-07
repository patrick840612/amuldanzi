package com.amuldanzi.domain;

import java.util.Date;

import lombok.Data;

@Data
public class JwtDTO {
	
	private String access_token;
	private String refresh_token;
	private Date access_token_valid; // 유효기한
	private Date refresh_token_valid;
	private Integer jwt_state; // 폐기(0-폐기X / 1-폐기)
	private String id;
	
}
