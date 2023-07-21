package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.NoticeService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService service;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/notice")
	public void Notice(Model m) {

		List<NoticeDTO> noticeList = service.getNoticeList();
		m.addAttribute("noticeList", noticeList);
		System.out.println(noticeList);
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
	}

	@RequestMapping("/noticeDetail")
	public void noticeDetail(@RequestParam("title") String noticeTitle, Model model) {

		NoticeDTO notice = service.getNoticeByNoticeTitle(noticeTitle);

		if (notice != null) {
			notice.setCount(notice.getCount() + 1);
			service.noticeUpdate(notice);
			model.addAttribute("notice", notice);
			
			System.out.println("******************12345***************************************************");
			System.out.println(notice);		
			System.out.println("******************12345***************************************************");
			
		} else {
			// 예외 처리 또는 오류 페이지로 리다이렉트 등의 처리
			// 예시로 "error" 문자열을 반환합니다.
			// 필요에 따라 적절한 오류 처리를 수행하세요.
			model.addAttribute("error", "해당 공지사항을 찾을 수 없습니다.");
		}
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
