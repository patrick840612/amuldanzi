package com.amuldanzi.controller;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amuldanzi.domain.BoardCategoryDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketDTO;
import com.amuldanzi.domain.NoticeDTO;

import com.amuldanzi.service.AdminService;
import com.amuldanzi.service.ClinicService;
import com.amuldanzi.service.NoticeService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	

	@RequestMapping("/adminContentList")
	public void adminCateList(Model m) {

		List<NoticeDTO> list = adminService.getNoticeList();
		m.addAttribute("list", list);

	}

	@RequestMapping("/adminContentCate")
	@ResponseBody
	public List adminContentCate(@RequestParam("cateId") Integer cateId) {
		System.out.println("컨트롤러 요청: " + cateId);

		List list = adminService.getListByCateId(cateId);

		return list;
	}

	@RequestMapping("/adminContentInsert")
	public void adminContentInsert() {

	}
	
	@RequestMapping("/noticeSave")
	public String noticeSave(NoticeDTO dto) {
		
		BoardCategoryDTO category = new BoardCategoryDTO(0,"공지");
		dto.setBoardCate(category);
		
		adminService.noticeSave(dto);
		return "redirect:/admin/adminContentList";
	}
	
	@RequestMapping("/eduSave")
	public String eduSave(EducationDTO dto) {
		
		BoardCategoryDTO category = new BoardCategoryDTO(2,"교육정보");
		dto.setBoardCate(category);
		
		adminService.eduSave(dto);
		return "redirect:/admin/adminContentList";
	}
	
	@RequestMapping("/careSave")
	private String careSave(CareDTO dto) {
		
		BoardCategoryDTO category = new BoardCategoryDTO(3,"케어정보");
		dto.setBoardCate(category);
		
		adminService.careSave(dto);
		return "redirect:/admin/adminContentList";
		
	}
	
	@RequestMapping("/adminMain")
	public void adminMain() {

	}

	@RequestMapping("/adminADList")
	public void adminAdList() {

	}

	@RequestMapping("/adminADInsert")
	public void adminAdInsert() {

	}

}
