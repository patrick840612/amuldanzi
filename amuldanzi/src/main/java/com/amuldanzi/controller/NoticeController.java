package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amuldanzi.service.NoticeService;

@Controller
@RequestMapping("/InfoNotice")
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping("/Notice")
	public void Notice(Model m) {
//		List<NoticeDTO> noticeList = 
	}
}
