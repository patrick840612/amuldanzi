package com.amuldanzi.service;

import java.util.Date;
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
	public void socialRegist(MemberSocialDTO memberSocial);
	
	public void setJwtStateDiscard(String access_token);
	public String selectRefreshByAccess(String access_token);
	public JwtDTO selectExpiration(String refresh_token);
	public void saveJWT(JwtDTO jwt);
	public Date getExpireDateAccessToken();
	public String createToken(MemberInfoDTO member, Date expireDate);
	
	public List<JwtDTO> findAll();
	public void changePassword(MemberInfoDTO member);
	
}
