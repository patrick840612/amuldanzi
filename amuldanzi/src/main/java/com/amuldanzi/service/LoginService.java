package com.amuldanzi.service;

import java.util.List;

import org.springframework.lang.Nullable;

import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;

import io.jsonwebtoken.Claims;

public interface LoginService {

	public String googleLogin(String code);
	public String kakaoLogin(String code);
	public String sRegistCheck(MemberSocialDTO member);
	public String loginCheck(MemberInfoDTO member);
	public void regist(MemberInfoDTO member, List<MemberPetDTO> petList);
	public Claims getClaims(String token);
	public JwtDTO createJwt(MemberInfoDTO member);
	public MemberInfoDTO selectById(MemberInfoDTO member);
	public boolean idCheck(MemberInfoDTO member);
	public boolean emailCheck(MemberInfoDTO member);
	public boolean telCheck(MemberInfoDTO member);
	public MemberInfoDTO socialCheck(@Nullable MemberInfoDTO member);
	
}
