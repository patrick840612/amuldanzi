package com.amuldanzi.controller;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.auth.SNSLogin;
import com.amuldanzi.auth.SnsValue;
import com.amuldanzi.domain.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private SnsValue naverSns;

	@Autowired
	private SnsValue googleSns;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@RequestMapping(value="/auth/{service}/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService, Model model, @RequestParam String code, HttpSession session) throws Exception{
		
		SnsValue sns = null;
		if(StringUtils.equals("naver", snsService)) {
			sns = naverSns;
		}else {
			sns = googleSns;
		}
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		
		User snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
		System.out.println("Profile>>"+snsUser);
//		model.addAttribute("result", snsUser);
		
		// 3. DB 해당 유저가 존재하는지 체크 (googleid, naverid 컬럼 추가)
		User user = service.getBySns(snsUser);
		if(user == null) {
			model.addAttribute("result","존재하지 않는 사용자입니다. 가입해 주세요.");
		}else {
			model.addAttribute("result", user.getUname() + "님 반값습니다.");
		}
		
		// 4. 존재시 강제로그인, 미존재시 가입페이지로!!
		
		
		return "loginResult";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void login(SnsValue snsV, Model model) {
		System.out.println("login GET.................");
		
		SNSLogin snsLogin = new SNSLogin(googleSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSLogin googleLogin = new SNSLogin(googleSns);
//		model.addAttribute("google_url", googleLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);

	}

}
