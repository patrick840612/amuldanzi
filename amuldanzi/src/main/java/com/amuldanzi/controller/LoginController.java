package com.amuldanzi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.config.ConfigUtils;
import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.service.LoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ConfigUtils util;
	
	// 페이지 이동
	@RequestMapping("/{step}")
	public String login(@PathVariable String step) {
		return "/login/"+step;
	}
	
	// 구글 로그인
	@RequestMapping(value="/googleCallback", method = RequestMethod.GET)
	public String googleLogin(@RequestParam@PathVariable String code, Model m) {
		String email = loginService.googleLogin(code);
		MemberInfoDTO member = new MemberInfoDTO();
		member.setUserEmail(email);
		member.setSocial("google");
		String id = loginService.sLoginCheck(member);
		
		if(id != "") {
			m.addAttribute("id", id);
			return "/login/login";
		}else {
			m.addAttribute("member", member);
			return "/login/register";
		}
	}
	
	// 구글 로그인 uri 생성하기
	@ResponseBody
	@RequestMapping("/getGoogleLoginUri")
	public String getGoogleLoginUri() {
		return util.googleInitUrl();
	}
	
	// 카카오 로그인 uri 생성해서 가져가기
	@RequestMapping("/getKakaoLoginUri")
	@ResponseBody
	public String getKakaoLoginUri() {
		return util.kakaoInitUrl();
	}
	
	// 일반 로그인 확인
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(MemberInfoDTO member) {
		String id = loginService.loginCheck(member);
		return id;
	}
	
	// jwt토큰 생성
	@RequestMapping("/login")
	public String login(MemberInfoDTO id, HttpServletResponse res) {
		MemberInfoDTO member = loginService.selectById(id);
		
		JwtDTO jwt = loginService.createJwt(member);
		
		Cookie cookie1 = new Cookie("access_token", jwt.getAccess_token());
		long access_token_valid = jwt.getAccess_token_valid().getTime() - System.currentTimeMillis(); // 만료 날짜와 현재 시간의 차이를 계산
		cookie1.setHttpOnly(true); // 보안설정 -> JavaScript코드로 쿠키에 접근 불가
        cookie1.setMaxAge((int) (access_token_valid / 1000)); // 쿠키 유효기간은 초 단위로 설정
        cookie1.setPath("/"); // 쿠키의 범위를 전체 애플리케이션으로 설정 (루트 패스 이하 모든 경로에서 쿠키 접근 가능)
        res.addCookie(cookie1);
        
        Cookie cookie2 = new Cookie("refresh_token", jwt.getRefresh_token());
		long refresh_token_valid = jwt.getRefresh_token_valid().getTime() - System.currentTimeMillis(); // 만료 날짜와 현재 시간의 차이를 계산
		cookie2.setHttpOnly(true);
		cookie2.setMaxAge((int) (refresh_token_valid / 1000)); // 쿠키 유효기간은 초 단위로 설정
		cookie2.setPath("/"); // 쿠키의 범위를 전체 애플리케이션으로 설정 (루트 패스 이하 모든 경로에서 쿠키 접근 가능)
        res.addCookie(cookie2);
		
		return "/login/login";
	}
	
	// 회원가입
	@RequestMapping("/regist")
	public String regist(MemberInfoDTO member, Model m) {
		loginService.regist(member);
		m.addAttribute("id", member.getId());
		System.out.println(member);
		return "/main/index";
	}
	

}
