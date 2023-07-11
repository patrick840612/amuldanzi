package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping("/notice")
	public void Notice(Model m) {
		List<NoticeDTO> noticeList = service.getNoticeList();
		m.addAttribute("noticeList", noticeList);
		System.out.println(noticeList);
	}
	
	/*
	 * @RequestMapping("/noticeDetail") public void noticeDetail(NoticeDTO dto,
	 * Model m) {
	 * 
	 * NoticeDTO notice = service.noticeList(dto);
	 * 
	 * notice.setNoticeCnt(notice.getNoticeCnt()+1); service.noticeUpdate(notice);
	 * 
	 * m.addAttribute("notice", notice); }
	 */
	
	@RequestMapping("/noticeDetail")
	public void noticeDetail(@RequestParam("noticeTitle") String noticeTitle, Model model) {
	    NoticeDTO notice = service.getNoticeByNoticeTitle(noticeTitle);

	    if (notice != null) {
	        notice.setNoticeReadCount(notice.getNoticeReadCount() + 1);
	        service.noticeUpdate(notice);
	        model.addAttribute("notice", notice);
	        System.out.println(notice);
	    } else {
	        // 예외 처리 또는 오류 페이지로 리다이렉트 등의 처리
	        // 예시로 "error" 문자열을 반환합니다.
	        // 필요에 따라 적절한 오류 처리를 수행하세요.
	        model.addAttribute("error", "해당 공지사항을 찾을 수 없습니다.");
	        
	    }
	}
	/*
	 * @RequestMapping("/notice") public String notice() { return
	 * "redirect:/notice/notice"; }
	 */

	
}
