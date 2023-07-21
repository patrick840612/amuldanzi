package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.service.EducationService;
import com.amuldanzi.service.LoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Autowired
	EducationService service;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/education")
	public void education(Model m) {
		
		List<EducationDTO> eduList = service.geteduList();
		m.addAttribute("eduList", eduList);
		System.out.println(eduList);
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
		
	}
	
	// 페이지 이동시 회원역할에 따른 헤더 변경하기 정보 얻기 함수
	private Map<String,Object> headerChange() {
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
	        map.put("memberRole", memberRole);
	        map.put("id", id);

		}else {
	        map.put("memberRole", "");
	        map.put("id", "");

		}
		return map;
		
	}// 페이지 이동시 회원역할에 따른 헤더 변경하기 끝

}
