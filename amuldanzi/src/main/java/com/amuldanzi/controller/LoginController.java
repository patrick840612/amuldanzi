package com.amuldanzi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.config.ConfigUtils;
import com.amuldanzi.domain.JwtDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.service.LoginService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
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
			return "/main/index";
		}else {
			m.addAttribute("member", member);
			return "/login/register";
		}
	}
	
	// 카카오 로그인
	@RequestMapping(value = "/kakaoCallback", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam@PathVariable String code, Model m) {
		String email = loginService.kakaoLogin(code);
		String social = "kakao";
		
		MemberInfoDTO member = new MemberInfoDTO();
		member.setUserEmail(email);
		member.setSocial(social);
		String id = loginService.sLoginCheck(member);
		
		if(id != "") {
			m.addAttribute("id", id);
			return "/main/index";
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
	public String login(MemberInfoDTO id, HttpServletResponse res, Model m) {
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
        
        //m.addAttribute("id", id.getId());
        
        return "/main/index";


	}
	
	// 회원가입
	@RequestMapping("/regist")
	public String regist(@ModelAttribute MemberInfoDTO member, @ModelAttribute MemberPetDTO pets, Model m) {
		
		m.addAttribute("id", member.getId());
		List<MemberPetDTO> petList = new ArrayList<>();
		if (pets != null && hasPetData(pets)) {		

			// 반려동물 목록이 있으면 있는 수만큼 memberPetDTO 객체 생성하여 setter, 반려동물 없으면 없는 걸로 처리(삼항연산자)
	        String[] petNames = (pets.getPetName() != null) ? pets.getPetName().split(",") : new String[0];
	        String[] whichPets = (pets.getWhichPet() != null) ? pets.getWhichPet().split(",") : new String[0];
	        String[] petBloods = (pets.getPetBlood() != null) ? pets.getPetBlood().split(",") : new String[0];
	        String[] gpss = (pets.getGps() != null) ? pets.getGps().split(",") : new String[0];
			
			for (int i = 0; i < petNames.length; i++) {
	
		        MemberPetDTO memberPetDTO = new MemberPetDTO();
	
		        memberPetDTO.setPetName(petNames[i]);
		        memberPetDTO.setWhichPet(whichPets[i]);
		        memberPetDTO.setPetBlood(petBloods[i]);
		        memberPetDTO.setGps(gpss[i]);
		        memberPetDTO.setMemberId(member);
		        
		        petList.add(memberPetDTO);
		    }
		 }
			
		loginService.regist(member, petList);
	
		return "/main/index";
	} // 회원가입 완료
	
	// MemberPetDTO pets 에 값이 있는지 확인 하는 함수
	private boolean hasPetData(MemberPetDTO pets) {
		 return pets != null &&
		           (pets.getPetName() != null && !pets.getPetName().isEmpty()) ||
		           (pets.getWhichPet() != null && !pets.getWhichPet().isEmpty()) ||
		           (pets.getPetBlood() != null && !pets.getPetBlood().isEmpty()) ||
		           (pets.getGps() != null && !pets.getGps().isEmpty());
	}

	// 중복체크 idCheckServiceCon
	@RequestMapping("/idCheckServiceCon")
	@ResponseBody
	public Map<String,Object> idCheckServiceCon(MemberInfoDTO member, Model m) {
		
		// 중복 체크 메소드 호출
		boolean resultId = loginService.idCheck(member);
		boolean resultTel = loginService.telCheck(member);
		boolean resultEmail = loginService.emailCheck(member);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("resultId", resultId);
		map.put("resultTel", resultTel);
		map.put("resultEmail", resultEmail);
		return map;
	}
	
	// 헤더에서 토큰으로 id값을 얻어오기(토큰이 없으면 값이 없음)
	@RequestMapping(value = "/loginWithToken", method = RequestMethod.POST)
	@ResponseBody
    public Map<String,Object> loginWithToken(MemberInfoDTO member, HttpServletRequest request, Model m) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
        Cookie[] cookies = request.getCookies();
        String accessToken = null;
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("access_token".equals(cookie.getName())) {
                    accessToken = cookie.getValue();
                    break;
                }
            }
        }

		if(accessToken != null) {
	        String id = (String)loginService.getClaims(accessToken).get("id");
	        String memberRole = (String)loginService.getClaims(accessToken).get("memberRole");
	        map.put("id", id);
	        map.put("memberRole", memberRole);
	        m.addAttribute("id", id);
		}
        
        return map;
    } // 헤더 로그인 조건 완료



}
