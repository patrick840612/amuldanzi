package com.amuldanzi.controller;

import java.security.Key;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import com.amuldanzi.config.ConfigUtils;
import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.exception.WrongContectException;
import com.amuldanzi.service.LoginService;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller
@ControllerAdvice // 예외 발생 감지
public class ExceptionController {
	
	@Autowired
	private HttpServletRequest req;
	
	@Autowired
	private HttpServletResponse res;
	
	@Autowired
    private ConfigUtils util;
	
	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping("/errorpage/wrongcontect")
	public void wrongcontect() {
		
	}
	
	@ExceptionHandler(WrongContectException.class)
	public String handleWrongContectException(WrongContectException ex) {
		
		return "redirect:/errorpage/wrongcontect";
	}
	
	@ExceptionHandler(SQLException.class)
	public String SqlException(SQLException ex) {
		
		return "redirect:/errorpage/wrongcontect";
	}
	
	@ExceptionHandler(io.jsonwebtoken.security.SignatureException.class)
	public String SignatureException(io.jsonwebtoken.security.SignatureException ex) {
		
		return "redirect:https://www.police.go.kr/index.do";
	}
	
	@ExceptionHandler(io.jsonwebtoken.MalformedJwtException.class)
	public String MalformedJwtException(io.jsonwebtoken.MalformedJwtException ex) {
		
		return "redirect:https://www.police.go.kr/index.do";
	}
	
	@ExceptionHandler(ExpiredJwtException.class)
	public String handleExpiredJwtException(ExpiredJwtException ex) {
		//System.out.println("엑세스토큰 만료");
		String fullPath = req.getRequestURI();
		//System.out.println(fullPath);
		
		String access_token = null;
		String refresh_token = null;
		
		Cookie[] cookies = req.getCookies();
		// 이용자 request에서 쿠키 얻어옴
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if (cookie.getName().equals("access_token")) {
					access_token = cookie.getValue();
                }else if(cookie.getName().equals("refresh_token")) {
                	refresh_token = cookie.getValue();
                }
			}
		}
		//System.out.println("엑세스토큰 : "+ access_token);
		//System.out.println("리프레쉬토큰 : "+ refresh_token);
		// 리프레쉬토큰이 없을 경우(엑세스코드의 탈취일 가능성 매우 높음)
		if(refresh_token == null) {
			// db에서 해당 엑세스토큰 사용정지
			loginService.setJwtStateDiscard(access_token);
			
			// 쿠키에서 엑세스토큰 삭제
	        Cookie cookie = new Cookie("access_token", null);
	        cookie.setPath("/");
	        cookie.setMaxAge(0);

	        // 쿠키를 응답에 추가
	        res.addCookie(cookie);
	        //System.out.println("리프레쉬토큰이 없을 경우");
			
	        return "redirect:https://www.police.go.kr/index.do";
		}
		
		// 리프레쉬토큰이 유효한지 확인
		if(isTokenValid(refresh_token)) {
			//System.out.println("리프레쉬토큰이 유효할 경우");
			// 유효할 경우
			// 엑세스토큰으로 db에 매칭되어있는 리프레쉬토큰을 찾아서 사용자에게 받아온 리프레쉬토큰과 비교
			String dbtoken = loginService.selectRefreshByAccess(access_token);
			//System.out.println("에세스토큰 : "+ access_token);
			//System.out.println("db리프레쉬토큰 : "+ dbtoken);
			if(!refresh_token.equals(dbtoken)) {
				//System.out.println("db와 다를 경우");
				// 다를 경우(토큰 탈취 가능성 높음)
				
				// db에서 해당 엑세스토큰 사용정지
				loginService.setJwtStateDiscard(access_token);
				
				// 쿠키에서 엑세스토큰 삭제
		        Cookie cookie1 = new Cookie("access_token", null);
		        cookie1.setPath("/");
		        cookie1.setMaxAge(0);

		        // 쿠키를 응답에 추가
		        res.addCookie(cookie1);
		        
		        // 쿠키에서 리프레쉬토큰 삭제
		        Cookie cookie2 = new Cookie("refresh_token", null);
		        cookie2.setPath("/");
		        cookie2.setMaxAge(0);

		        // 쿠키를 응답에 추가
		        res.addCookie(cookie2);

		        return "redirect:https://www.police.go.kr/index.do";
			}
			//System.out.println("재발급 시작");
			// 리프레쉬토큰 유효기한 얻어와서 쿠키에 엑세스토큰 넣기
			JwtDTO refresh_token_expiration = loginService.selectExpiration(refresh_token);
			
			// db에서 기존의 엑세스토큰 사용정지
			loginService.setJwtStateDiscard(refresh_token_expiration.getAccess_token());
			
			// 리프레쉬토큰에서 사용자id 받아옴
			Claims claims = loginService.getClaims(refresh_token);
			String id = claims.get("id", String.class);
			MemberInfoDTO member = new MemberInfoDTO();
			member.setId(id);
			// 사용자id로 사용자정보 받아옴
			member = loginService.selectById(member);
			// 엑세스토큰 재발급
			Date access_token_valid = loginService.getExpireDateAccessToken();
			String accessToken = loginService.createToken(member, access_token_valid);
			
			
			//System.out.println(refresh_token_expiration);
			
			long refresh_token_valid = refresh_token_expiration.getRefresh_token_valid().getTime() - System.currentTimeMillis(); // 만료 날짜와 현재 시간의 차이를 계산
			
			Cookie cookie = new Cookie("access_token", accessToken);
			
			cookie.setHttpOnly(true); // 보안설정 -> JavaScript코드로 쿠키에 접근 불가
	        cookie.setMaxAge((int) (refresh_token_valid / 1000)); // 쿠키 유효기간은 초 단위로 설정 -> 엑세스토큰 유효기한 1시간 // 쿠키에 남아있는 기한 리프레쉬토큰과 같게
	        cookie.setPath("/"); // 쿠키의 범위를 전체 애플리케이션으로 설정 (루트 패스 이하 모든 경로에서 쿠키 접근 가능)
	        res.addCookie(cookie);
	        
	        // db에 토큰 넣기
	        JwtDTO jwt = new JwtDTO();
	        jwt.setAccess_token(accessToken);
	        jwt.setAccess_token_valid(access_token_valid);
	        jwt.setRefresh_token(refresh_token);
	        jwt.setRefresh_token_valid(refresh_token_expiration.getRefresh_token_valid());

	        loginService.saveJWT(jwt);

	        return "redirect:"+fullPath;
		}else {
			// 리프레쉬토큰이 유효하지 않을 경우 로그아웃처리
			//System.out.println("로그아웃");
			// db에서 해당 엑세스토큰 사용정지
			loginService.setJwtStateDiscard(access_token);
			
			// 쿠키에서 엑세스토큰 삭제
	        Cookie cookie1 = new Cookie("access_token", null);
	        cookie1.setPath("/");
	        cookie1.setMaxAge(0);

	        // 쿠키를 응답에 추가
	        res.addCookie(cookie1);
	        
	        // 쿠키에서 리프레쉬토큰 삭제
	        Cookie cookie2 = new Cookie("refresh_token", null);
	        cookie2.setPath("/");
	        cookie2.setMaxAge(0);

	        // 쿠키를 응답에 추가
	        res.addCookie(cookie2);
	        
	        return "redirect:/main/index";
		}
	}
	
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
}
