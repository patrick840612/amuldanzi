package com.amuldanzi.controller;

import java.util.ArrayList;
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
// 정보게시판 - 공지사항
	
	@Autowired
	NoticeService service;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private HttpServletRequest request;

	// 공지사항 목록 요청
	@RequestMapping("/notice")
	public String Notice(Model m, @RequestParam(name = "page", defaultValue = "1") int currentPage) throws InterruptedException {
		
		// 한 페이지에 표시되는 공지사항의 목록 개수는 최대 5개
		int itemsPerPage = 5;
		// id 기준으로 정렬된 모든 공지사항 가져오기
		List<NoticeDTO> noticeList = service.getAllByOrderById();
		
		//페이징 처리를 위해 전체 항목 수와 페이지 수 계산
		int totalItems = noticeList.size();
		int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		
		// 페이지 번호는 1 이상이어야 하므로 1미만의 값일 경우 currentPage는 1로 설정됨
	    currentPage = Math.max(1, currentPage); 
	    //currentPage와 totalPages의 변수 값을 비교하여 더 작은 값을 currentPage에 대입. 전체페이지 개수인 totalPages보다 큰 페이지 번호는 존재하지 못한다. 
		currentPage = Math.min(currentPage, totalPages);
		
		// 현재 페이지에 표시할 공지사항 목록의 시작 인덱스
		int startIndex = (currentPage -1)*itemsPerPage;
		//현재 페이지에 표시해야 할 공지사항 목록의 끝 인덱스
		int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
		
		// 시작 및 끝 인덱스가 유효한 범위 내에 있는지 확인
		startIndex = Math.max(0, startIndex);
		endIndex = Math.max(startIndex, endIndex);
		
		// 현재 페이지에 해당하는 공지사항 리스트 가져오기
		List<NoticeDTO> paginatedNoticeList = new ArrayList<>();
		if(startIndex < noticeList.size() && startIndex <= endIndex) {
			paginatedNoticeList = noticeList.subList(startIndex, endIndex);
		}
		
		// 뷰에 렌더링할 모델 속성을 추가
		m.addAttribute("noticeList", paginatedNoticeList);
		System.out.println(paginatedNoticeList);
		m.addAttribute("totalPages", totalPages);
        m.addAttribute("currentPage", currentPage);
		

		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        return "/notice/notice";
	}

	// 특정 공지사항의 세부내용 요청
	@RequestMapping("/noticeDetail")
	public void noticeDetail(@RequestParam("title") String noticeTitle, Model model) {

		// noticeTitle로 특정 공지사항을 데이터베이스에 가져오기
		NoticeDTO notice = service.getNoticeByNoticeTitle(noticeTitle);

		// 공지사항 조회수 증가
		if (notice != null) {
			notice.setCount(notice.getCount() + 1);
			service.noticeUpdate(notice);
			model.addAttribute("notice", notice);
			
		} else {
			model.addAttribute("error", "해당 공지사항을 찾을 수 없습니다.");
		}
	}
	
	// 페이지 이동 시 회원역할에 따른 헤더 변경하기 정보 얻기 함수
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
