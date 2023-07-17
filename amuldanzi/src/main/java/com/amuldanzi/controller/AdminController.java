package com.amuldanzi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.BoardCategoryDTO;
import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.service.AdminService;

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
		BoardCategoryDTO category = new BoardCategoryDTO(0, "공지");
		dto.setBoardCate(category);
		dto.setCount(0);
		adminService.noticeSave(dto);
		return "redirect:/admin/adminContentList";
	}

	@RequestMapping(value = "/eduSave", method = RequestMethod.POST)
	public String eduSave(EducationDTO dto) {

		BoardCategoryDTO category = new BoardCategoryDTO(2, "교육정보");
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

		BoardCategoryDTO category = new BoardCategoryDTO(3, "케어정보");
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

//	@RequestMapping(value = "/adSave", method = RequestMethod.POST)
//	public String adSave(@RequestParam("file") MultipartFile file, AdvertisementDTO dto) {
//		
//		
//		
//	    try {
//	    	System.out.println("========================================================");
//	    	System.out.println(file);
//	    	String oriFilename = file.getOriginalFilename();
//	    	System.out.println("[[[[["+oriFilename);
//			
//			if(oriFilename !=null && !oriFilename.equals("")) {
//				System.out.println("********************************************************=");
//				System.out.println("파일첨부가 있는 경우");
//
//				
//
//				String filename = new MD5Generator(oriFilename).toString();
//
//				
//
//				String savePath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\admin\\files\\ad\\images";
//
//				if(!new File(savePath).exists()) {
//
//					new File(savePath).mkdir(); //카테고리별로 파일을 만들어 관리
//
//				}
//
//				String filepath =  savePath + "\\" + filename;
//
//				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"
//
//				file.transferTo(new File(filepath));
//				
//				dto.setImg(oriFilename);
//				dto.setImgPath(filepath);
//				
//				adminService.adSave(dto);
//				
//				
//				
//	            
//	        }else {
//	        	
//	        	System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//	        
//	        	adminService.adSave(dto);
//	        
//	        }
//	        
//	        return "redirect:/admin/adList";
//	        
//	    } catch (Exception ex) {
//	    	
//	        ex.printStackTrace();
//	        // 업로드 실패 처리
//	        return "redirect:/admin/adInsert?error";
//	    }
//	}

	@RequestMapping(value = "/adSave", method = RequestMethod.POST)
	public String adSave(AdvertisementDTO adDto, @RequestParam("file") MultipartFile file,
			RedirectAttributes redirectAttributes) {

		try {
			// Save the file
			String filepath = adDto.getImgPath(); // Get the filepath from the DTO
			file.transferTo(new File(filepath));

			// Save the Ad to the database
			adminService.adSave(adDto);

			redirectAttributes.addFlashAttribute("message", "Ad saved successfully!");
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "Error saving ad: " + e.getMessage());
		}

		return "redirect:/admin/adList";
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
