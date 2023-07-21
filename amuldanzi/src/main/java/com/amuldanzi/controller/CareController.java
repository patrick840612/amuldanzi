package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.service.CareService;
import com.amuldanzi.service.LoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/care")
public class CareController {
	
	@Autowired
	CareService service;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/care")
	public void care(Model m) {
		
		List<CareDTO> careList = service.getCareList();
		m.addAttribute("careList", careList);
		System.out.println(careList);
		
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
	
	@RequestMapping("/careDetail")
	public void careDetail(@RequestParam("id") Integer careId, Model m) {
		CareDTO care = service.getCareByCareId(careId);
		m.addAttribute("care", care);
	}

}
