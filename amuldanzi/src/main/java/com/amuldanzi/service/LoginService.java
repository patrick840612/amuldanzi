package com.amuldanzi.service;

import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;

import io.jsonwebtoken.Claims;

public interface LoginService {

	public String googleLogin(String code);
	public String kakaoLogin(String code);
	public String sLoginCheck(MemberInfoDTO member);
	public String loginCheck(MemberInfoDTO member);
	public void regist(MemberInfoDTO member);
	public Claims getClaims(String token);
	public JwtDTO createJwt(MemberInfoDTO member);
	public MemberInfoDTO selectById(MemberInfoDTO member);
	public boolean idCheck(MemberInfoDTO member);
	public boolean emailCheck(MemberInfoDTO member);
	public boolean telCheck(MemberInfoDTO member);
	
}
