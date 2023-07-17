package com.amuldanzi.controller;

import java.io.Console;
import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.BoardCategoryDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.ClinicDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.MarketInfoDTO;
import com.amuldanzi.domain.NoticeDTO;

import com.amuldanzi.service.AdminService;
import com.amuldanzi.service.ClinicService;
import com.amuldanzi.service.NoticeService;
import com.amuldanzi.util.MD5Generator;

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
	
	@RequestMapping(value = "/noticeSave", method = RequestMethod.POST)
	public String noticeSave(NoticeDTO dto) {		
		BoardCategoryDTO category = new BoardCategoryDTO(0,"공지");
		dto.setBoardCate(category);
		dto.setCount(0);
		adminService.noticeSave(dto);
		return "redirect:/admin/adminContentList";
	}
	
	
	@RequestMapping(value = "/eduSave", method = RequestMethod.POST)
	public String eduSave(EducationDTO dto) {
		
		BoardCategoryDTO category = new BoardCategoryDTO(2,"교육정보");
		dto.setBoardCate(category);
		dto.setCount(0);
		adminService.eduSave(dto);
		
		return "redirect:/admin/adminContentList";
	}
	
	
//	@RequestMapping("/eduSave")
//	public String eduSave(@RequestParam("file") MultipartFile files, EducationDTO dto) {
//		
//		try {
//			
//			String oriFilename = files.getOriginalFilename();
//		
//			if(oriFilename !=null && !oriFilename.equals("")) {
//				
//				String filename =  new MD5Generator(oriFilename).toString();
//				
//				String savePath = System.clearProperty("user.dir")+"\\src\\main\\resources\\static\\files\\images";
//				if(!new File(savePath).exists()) {
//					new File(savePath).mkdir();
//				}
//				String filepath = savePath + "\\" + filename;
//				
//				files.transferTo(new File(filepath));
//				
//				
//				
//			
//				
//				
//				
//			}
//		
//		
//		
//		BoardCategoryDTO category = new BoardCategoryDTO(2,"교육정보");
//		dto.setBoardCate(category);
//		dto.setCount(0);
//		adminService.eduSave(dto);
//		
//		
//		}
//		
//		
//		
//		return "redirect:/admin/adminContentList";
//	}
	
	@RequestMapping(value = "/careSave", method = RequestMethod.POST)
	public String careSave(CareDTO dto) {
		
		BoardCategoryDTO category = new BoardCategoryDTO(3,"케어정보");
		dto.setBoardCate(category);
		dto.setCount(0);
		adminService.careSave(dto);
		return "redirect:/admin/adminContentList";
		
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(NoticeDTO dto) {
		
		adminService.noticeDelete(dto);
		return "redirect:/admin/adminContentList";
	}
	
	@RequestMapping("/eduDelete")
	public String eduDelete(EducationDTO dto) {
		
		adminService.eduDelete(dto);
		return "redirect:/admin/adminContentList";		
	}
	
	@RequestMapping("/careDelete")
	public String careDelete(CareDTO dto) {
		
		adminService.careDelete(dto);
		return "redirect:/admin/adminContentList";	
	}
	
	@RequestMapping("/adminMain")
	public void adminMain() {

	}

	@RequestMapping("/adList")
	public void adList(Model m) {
		
		List<AdvertisementDTO> adlist = adminService.getAdList();
		m.addAttribute("adList", adlist);		

	}
	
	@RequestMapping("/adInsert")
	private void adInsert() {
		// TODO Auto-generated method stub
		
	}
	
	@RequestMapping("/adDelete")
	private String adDelete(AdvertisementDTO dto) {
		// TODO Auto-generated method stub
		adminService.adDelete(dto);
		return "redirect:/admin/adList";	
	}
	
	@RequestMapping(value = "/adSave", method = RequestMethod.POST)
	public String adSave(@RequestParam("file") MultipartFile file, AdvertisementDTO dto) {
	    try {
	        if (!file.isEmpty()) {
	            String originalFilename = file.getOriginalFilename();
	            String fileName = new MD5Generator(originalFilename).toString();
	            String savePath = "src/main/resources/static/files/images";
	            String filePath = savePath + "/" + fileName;
	            file.transferTo(new File(filePath));
	            dto.setImg(fileName);
	            dto.setImgPath(filePath);
	            adminService.adSave(dto);
	        }
	        
	        return "redirect:/admin/adList";
	        
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        return "redirect:/admin/adInsert?error";
	    }
	}
	
	@RequestMapping(value = "/adUpdate", method = RequestMethod.POST)
	public String adUpdate(AdvertisementDTO dto) {
		adminService.adUpdate(dto);
		return "redirect:/admin/adList";
	}
	
	@RequestMapping("/adminNoticeDetail")
	private void adminNoticeDetail(NoticeDTO dto, Model m) {
		// TODO Auto-generated method stub
		NoticeDTO notice = adminService.getNotice(dto);
		m.addAttribute("notice", notice);
	}
	
	@RequestMapping("/blamedList")
	public void blamedList() {
		
	}

}
