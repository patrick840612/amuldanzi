package com.amuldanzi.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Key;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.amuldanzi.config.ConfigUtils;
import com.amuldanzi.dao.CharacterDAO;
import com.amuldanzi.dao.LoginDAO;
import com.amuldanzi.dao.LoginJwtDAO;
import com.amuldanzi.dao.LoginPetDAO;
import com.amuldanzi.dao.LoginSocialDAO;
import com.amuldanzi.domain.CharacterDTO;
import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	private final RestTemplate restTemplate = new RestTemplate();
	
	private Integer authNumber;
	
	@Autowired
	private ConfigUtils util;
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Autowired
	private LoginSocialDAO loginSocialDAO;
	
	@Autowired
	private LoginPetDAO loginPetDAO;
	
	@Autowired
	private LoginJwtDAO loginJwtDAO;
	
	@Autowired
	private CharacterDAO characterDAO;
	
	// 구글 로그인
	public String googleLogin(String code) {
        String accessToken = getAccessToken(code);
        JsonNode userResourceNode = getUserResource(accessToken);
        
        String email = userResourceNode.get("id").asText();
        // System.out.println(userResourceNode.toPrettyString());
        
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
	
	// 카카오 로그인
	public String kakaoLogin(String code) {
		String accessToken = getKakaoToken(code);
        String email = getUserInfo(accessToken);
		
		return email;
	}	
	
	// 카카오 엑세스토큰 가져오기
	private String getKakaoToken(String authorize_code) {
		String access_token = "";
		String reqURL = util.getKakaoTokenUrl();
		try {
			URL url = new URL(reqURL);
	
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
	
			sb.append("&client_id="+util.getKakaoClientId()); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri="+util.getKakaoRedirectUri()); // REDIRECT_URI 본인이 설정한 주소 넣어주기
	
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
	
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			//System.out.println("responseCode : " + responseCode);
	
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
	
			while ((line = br.readLine()) != null) {
				result += line;
			}
			//System.out.println("response body : " + result);
	
			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
	
			access_token = jsonMap.get("access_token").toString();

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return access_token;
	}
	
	// 카카오 엑세스토큰으로 유저정보(이메일) 얻어오기
	private String getUserInfo(String access_token) {
		String reqURL = util.getKakaoResourceUrl();
		String email = "";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});
				//Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("id");
				String kakao_account = String.valueOf(jsonMap.get("id"));
				// System.out.println(properties.get("nickname"));
				// System.out.println(kakao_account.get("email"));
				email = kakao_account;

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return email;
	}
	
	// 소셜로그인 체크
	public String sRegistCheck(MemberSocialDTO member) {
		String id;
		
		id = loginSocialDAO.sRegistCheck(member);

		if(id == null)return "";
		else return id;
	}
	
	// 회원가입 시 반려동물 목록을 확인하여 함께 입력
	@Transactional
	public void regist(MemberInfoDTO member, List<MemberPetDTO> petList) {
	
		String pw = BCrypt.hashpw(member.getUserPassword(), BCrypt.gensalt());
		member.setUserPassword(pw);
		member.setSelectCharacter("cat.png");
		member.setCpoint(0);
		loginDAO.save(member); // x
		CharacterDTO character = new CharacterDTO();
		character.setMemberId(member);
		characterDAO.save(character); // o
		if (petList != null) {
			for(MemberPetDTO pet : petList) {
				loginPetDAO.save(pet);
			}
		}
	}
	
	public String loginCheck(MemberInfoDTO member) {
		String password = loginDAO.loginCheck(member.getId());
		
		if(password != null) {
			if(BCrypt.checkpw(member.getUserPassword(), password)) return member.getId();
			else return "";
		}else return "";
	}
	
	// memberInfoDTO로 jwt 토큰 생성
	public String createToken(MemberInfoDTO member, Date expireDate) {
		
		byte[] secret = util.getJwt_secret().getBytes();
	    Key key = Keys.hmacShaKeyFor(secret);
		
		return Jwts.builder()
                .claim("id", member.getId())
                .claim("memberRole", member.getMemberRole())
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
        String refreshToken = createToken(member, refresh_token_valid);
        
        JwtDTO jwt = new JwtDTO();
        jwt.setAccess_token(accessToken);
        jwt.setRefresh_token(refreshToken);
        jwt.setAccess_token_valid(access_token_valid);
        jwt.setRefresh_token_valid(refresh_token_valid);
        
        loginJwtDAO.save(jwt);
        
        return jwt;
    }
	
	// 엑세스토큰 유효기한 설정
	public Date getExpireDateAccessToken() {
	    long expireTimeMils = 1000 * 60 * 30;
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
	
	// 아이디 중복 체크
	public boolean idCheck(@Nullable MemberInfoDTO member) {
		boolean result = false;
		Optional<MemberInfoDTO> select = loginDAO.findById(member.getId());
		if(select.isPresent()) {
			result = true;
		}
		return result;
	}
	
	// 이메일 중복 체크
	public boolean emailCheck(@Nullable MemberInfoDTO member) {
		boolean result = false;
		Optional<MemberInfoDTO> select = loginDAO.findByUserEmail(member.getUserEmail());
		if(select.isPresent()) {
			result = true;
		}
		return result;
	}
	
	// 전화번호 중복 체크
	public boolean telCheck(@Nullable MemberInfoDTO member) {
		boolean result = false;
		Optional<MemberInfoDTO> select = loginDAO.findByUserTel(member.getUserTel());
		if(select.isPresent()) {
			result = true;
		}
		return result;
	}
	
	// 소셜용 전화번호로 아이디와 전화번가져오기
	public MemberInfoDTO socialCheck(@Nullable MemberInfoDTO member) {
		MemberInfoDTO mem = new MemberInfoDTO();
		Optional<MemberInfoDTO> select = loginDAO.findByUserTel(member.getUserTel());
		if(select.isPresent()) {
		    mem = select.get();
		}
		return mem;
	}
	
	// 소셜 회원가입 하기
	public void socialRegist(MemberSocialDTO memberSocial) {
		loginSocialDAO.save(memberSocial);
	}
	
	@Override
	public void setJwtStateDiscard(String access_token) {
		loginJwtDAO.setJwtStateDiscard(access_token);
		
	}

	@Override
	public String selectRefreshByAccess(String access_token) {
		return loginJwtDAO.selectRefreshByAccess(access_token);
	}
	
	@Override
	public JwtDTO selectExpiration(String refresh_token) {
		return loginJwtDAO.selectExpiration(refresh_token);
	}
	
	@Override
	public void saveJWT(JwtDTO jwt) {
		loginJwtDAO.recreatjwt(jwt);
	}
	
	// 스케쥴링 유효기간 지난 리프레쉬 토큰 지우기
	public List<JwtDTO> findAll() {
		List<JwtDTO> jwtlist = loginJwtDAO.findAll();		
		
		for(JwtDTO jwt : jwtlist) {
			if(!isTokenValid(jwt.getRefresh_token())) {
				loginJwtDAO.deleteById(jwt.getAccess_token());
			}
		}
		
		return jwtlist;
	}
	// 토큰의 유효성 검사
	public boolean isTokenValid(String token) {
        try {
        	
        	byte[] secret = util.getJwt_secret().getBytes();
    		Key key = Keys.hmacShaKeyFor(secret);
    		
            Claims claims = Jwts.parserBuilder()
 	               .setSigningKey(key)
 	               .build()
 	               .parseClaimsJws(token)
 	               .getBody();
            
            // 토큰의 Claims 정보에서 유효기한 확인
            Date expirationDate = claims.getExpiration();
            Date now = new Date();
            if (now.before(expirationDate)) {
                // 토큰이 유효한 경우
                return true;
            } else {
                // 토큰이 만료된 경우
                return false;
            }
        } catch (ExpiredJwtException ex) {
            // 토큰이 만료된 경우
            return false;
        } catch (Exception ex) {
            // 토큰 파싱 오류 등의 예외 발생 시
            return false;
        }
    }

	// 비밀번호 변경하기
	public void changePassword(MemberInfoDTO member) {
		String pw = BCrypt.hashpw(member.getUserPassword(), BCrypt.gensalt());
		member.setUserPassword(pw);
		loginDAO.changePassword(member);
	}
	
	public MemberInfoDTO selectCharacter(String id) {
		return loginDAO.findById(id).orElse(null);
	}
	
}
