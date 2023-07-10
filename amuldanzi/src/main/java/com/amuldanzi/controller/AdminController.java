package com.amuldanzi.controller;


import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.service.AdminContentService;

import jakarta.websocket.server.PathParam;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminContentService adminContentService;
	
	
	@RequestMapping("/adminContentList")
	public void adminContentList(@RequestParam("cate") Integer cate, Model m) {	
		
		if(cate == null || cate==1) {
			List<NoticeDTO> list = adminContentService.getNoticeList();
			m.addAttribute("list", list);
		}else if(cate == 2){
			List<EducationDTO> list = adminContentService.getEduList();
			m.addAttribute("list", list);
		}else if(cate == 3) {
			List<CareDTO> list = adminContentService.getCareList();
			m.addAttribute("list", list);
		}else if(cate == 4) {
			List<ClinicDTO> list = adminContentService.getClinicList();
			m.addAttribute("list", list);
		}else if(cate == 5) {
			List<MarketDTO> list = adminContentService.getMarketList();
			m.addAttribute("list", list);
		}
		
	}
	
	@RequestMapping("/adminContentInsert")
	public void adminContentInsert() {
	
	}	
	
	
	@RequestMapping("/adminMain")
	public void adminMain() {
		
	}
	
	@RequestMapping("/adminADList")
	public void adminADList() {
		
	}
	
	@RequestMapping("/adminADInsert")
	public void adminADInsert() {
		
	}
	

	


}
