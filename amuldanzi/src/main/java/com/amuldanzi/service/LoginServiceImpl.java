package com.amuldanzi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.amuldanzi.config.ConfigUtils;
import com.amuldanzi.dao.LoginDAO;
import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.fasterxml.jackson.databind.JsonNode;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

import java.security.Key;
import java.util.Date;

import org.mindrot.jbcrypt.BCrypt;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	private final RestTemplate restTemplate = new RestTemplate();
	
	private Integer authNumber;
	
	@Autowired
	private ConfigUtils util;
	
	@Autowired
	private LoginDAO loginDAO;
	
	// 구글 로그인
	public String googleLogin(String code) {
        String accessToken = getAccessToken(code);
        System.out.println("accessToken = " + accessToken);
        JsonNode userResourceNode = getUserResource(accessToken);
        
        String email = userResourceNode.get("email").asText();
        
        System.out.println("email = " + email);
        
        return email;
	}
	
	// 구글 엑세스토큰 얻어오기
	private String getAccessToken(String authorizationCode) {
		// security.properties에서 각 값 가져온다.
        String clientId = util.getGoogleClientId();
        String clientSecret = util.getGoogleSecret();
        String redirectUri = util.getGoogleRedirectUri();
        String tokenUri = util.getGoogleTokenUrl();
        
        // uri에 담을 params setting
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("code", authorizationCode);
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("redirect_uri", redirectUri);
        params.add("grant_type", "authorization_code");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity entity = new HttpEntity(params, headers);

        ResponseEntity<JsonNode> responseNode = restTemplate.exchange(tokenUri, HttpMethod.POST, entity, JsonNode.class);
        JsonNode accessTokenNode = responseNode.getBody();
        return accessTokenNode.get("access_token").asText();
    }
	
	// 구글 엑세스토큰으로 유저정보(이메일) 얻어오기
	private JsonNode getUserResource(String accessToken) {
        String resourceUri = util.getGoogleResourceUrl();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        HttpEntity entity = new HttpEntity(headers);
        return restTemplate.exchange(resourceUri, HttpMethod.GET, entity, JsonNode.class).getBody();
    }
	
	public String sLoginCheck(MemberInfoDTO member) {
		String id;
		
		id = loginDAO.sLoginCheck(member);
		
		if(id == null)return "";
		else return id;
	}
	
	public void regist(MemberInfoDTO member) {
		String pw = BCrypt.hashpw(member.getUserPassword(), BCrypt.gensalt());
		member.setUserPassword(pw);
		loginDAO.save(member);
	}
	
	public String loginCheck(MemberInfoDTO member) {
		String password = loginDAO.loginCheck(member);
		
		if(BCrypt.checkpw(member.getUserPassword(), password)) return member.getId();
		else return "";
	}
	
	// memberInfoDTO로 jwt 토큰 생성
	public String createToken(MemberInfoDTO member, Date expireDate) {
		
		byte[] secret = util.getJwt_secret().getBytes();
	    Key key = Keys.hmacShaKeyFor(secret);
		
		return Jwts.builder()
                .claim("id", member.getId())
                .claim("name", member.getUserName())
                .claim("address", member.getUserAddr())
                .claim("tel", member.getUserTel())
                .claim("email", member.getUserEmail())
                .claim("social", member.getSocial())
                .setExpiration(expireDate)
                .signWith(key)
                .compact();
	}
	
	// 토큰으로 유저정보 확인
	public Claims getClaims(String token) {
		
		byte[] secret = util.getJwt_secret().getBytes();
	    Key key = Keys.hmacShaKeyFor(secret);
		
		return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();
	}
	
	// jwt 생성
	public JwtDTO createJwt(MemberInfoDTO member) {
		Date access_token_valid = getExpireDateAccessToken();
		Date refresh_token_valid = getExpireDateRefreshToken();
        String accessToken = createToken(member, access_token_valid);
        String refreshToken = createToken(new MemberInfoDTO(), refresh_token_valid);
        
        JwtDTO jwt = new JwtDTO();
        jwt.setAccess_token(accessToken);
        jwt.setRefresh_token(refreshToken);
        jwt.setAccess_token_valid(access_token_valid);
        jwt.setRefresh_token_valid(refresh_token_valid);
        
        return jwt;
    }
	
	// 엑세스토큰 유효기한 설정
	public Date getExpireDateAccessToken() {
	    long expireTimeMils = 1000 * 60 * 60;
	    return new Date(System.currentTimeMillis() + expireTimeMils);
	 }
	
	// 리프레쉬토큰 유효기한 설정
	public Date getExpireDateRefreshToken() {
	    long expireTimeMils = 1000L * 60 * 60 * 24 * 60;
	    return new Date(System.currentTimeMillis() + expireTimeMils);
	}
	
	public MemberInfoDTO selectById(MemberInfoDTO member) {
		
		return loginDAO.findById(member.getId()).get();
	}
	
}
