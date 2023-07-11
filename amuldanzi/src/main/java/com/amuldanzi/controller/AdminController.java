package com.amuldanzi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.domain.NoticeDTO;

import com.amuldanzi.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminContentService;

	@RequestMapping("/adminContentList")
	public void adminCateList(Model m) {

		List<NoticeDTO> list = adminContentService.getNoticeList();
		m.addAttribute("list", list);

	}

	@RequestMapping("/adminContentCate")
	@ResponseBody
	public List adminContentCate(@RequestParam("cateId") Integer cateId) {
		System.out.println("컨트롤러 요청: " + cateId);

		List list = adminContentService.getListByCateId(cateId);

		return list;
	}

	@RequestMapping("/adminContentInsert")
	public void adminContentInsert() {

	}

	@RequestMapping("/adminMain")
	public void adminMain() {

	}

	@RequestMapping("/adminAdList")
	public void adminAdList() {

	}

	@RequestMapping("/adminAdInsert")
	public void adminAdInsert() {

	}

}
