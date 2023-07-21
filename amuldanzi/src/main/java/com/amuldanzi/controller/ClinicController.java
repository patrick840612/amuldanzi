package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.service.ClinicService;
import com.amuldanzi.service.LoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/clinic")
public class ClinicController {
	
	
	@Autowired
	ClinicService service; 
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/clinicInfo")
	public void clinicPage(Model m) {
		System.out.println("clinicDetail호출");
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
		
	}
	

	// 페이지 이동시 회원역할에 따른 헤더 변경하기 함수
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

	
	@GetMapping("/clinicMarker")
	@ResponseBody
	public List<HashMap<String, Object>> clinicDetail(Model model) {
		
		System.out.println("clinicDetail호출");
		List<HashMap<String, Object>> clinic = service.getAllClinics(); 
		System.out.println(clinic);
		
        return clinic; 
		
	}

	
	@GetMapping("/searchAll")
	@ResponseBody
	public List<Map<String, String>> searchAll(Model m) {
		
		System.out.println("searchAll 요청");
		
		List<Map<String, String>> clinicAll = service.getAllHospital();
		m.addAttribute("searchAll",clinicAll); 
	
		return clinicAll;
	}
	
	@GetMapping("/searchByLocation")
	@ResponseBody
	public List<HashMap<String, Object>> searchByLocation(@RequestParam("location") String location) {
		
		System.out.println("searchByLocation 요청");
		
		List<HashMap<String, Object>> Data = service.searchByLocation(location);
	
		return Data;
	}
	
	
	
}
