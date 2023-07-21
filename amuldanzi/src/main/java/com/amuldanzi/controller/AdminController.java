package com.amuldanzi.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
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

	@RequestMapping(value = "/adSave", method = RequestMethod.POST)
	public String adSave(@RequestParam("file") MultipartFile file, AdvertisementDTO dto) {		
		
	    try {
	    	
			String savePath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\ad";

			if(!new File(savePath).exists()) {

				new File(savePath).mkdir(); //카테고리별로 파일을 만들어 관리

			}
			
	    
	    	String oriFilename = file.getOriginalFilename();
	    	
			
			if(oriFilename !=null && !oriFilename.equals("")) {
				

				String filename = new MD5Generator(oriFilename).toString();
				String filepath =  savePath + "\\" + filename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				file.transferTo(new File(filepath));				
			
				dto.setImg(filename);
				dto.setImgPath(filepath);			
	            
	        }
	        
			adminService.adSave(dto);
			
	    } catch (Exception ex) {
	    	
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        return "redirect:/admin/adInsert?error";
	    }
	    
	    return "redirect:/admin/adList";
	}

	@DeleteMapping("/deleteImage")
    public void deleteImage(String imageName) {
        if (StringUtils.isEmpty(imageName)) {
            // 이미지 이름이 비어있으면 무시
            return;
        }

        try {
            // 여기서 imageName을 이용하여 이미지 파일 경로를 구한다.
        	String imagePath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\ad" + imageName;
            File imageFile = new File(imagePath);

            // 파일이 존재하면 삭제
            if (imageFile.exists()) {
                Files.delete(imageFile.toPath());
            }
        } catch (IOException e) {
            // 파일 삭제 중 오류 발생 시, 로그를 남기거나 예외를 처리하는 등의 추가 작업 가능
            e.printStackTrace();
        }
    }

	@RequestMapping(value = "/adModify", method = RequestMethod.POST)
	public String adUpdate(@RequestParam("file") MultipartFile file, AdvertisementDTO dto) {
		
		try {
	    	
			String savePath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\ad";

			if(!new File(savePath).exists()) {

				new File(savePath).mkdir(); //카테고리별로 파일을 만들어 관리

			}
			
	    
	    	String oriFilename = file.getOriginalFilename();
	    	
			
			if(oriFilename !=null && !oriFilename.equals("")) {
				

				String filename = new MD5Generator(oriFilename).toString();
				String filepath =  savePath + "/" + filename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				file.transferTo(new File(filepath));				
			
				dto.setImg(filename);
				dto.setImgPath(filepath);
				
				adminService.adUpdate(dto);	
				           
	        }
	        
	        
	    } catch (Exception ex) {
	    	
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        return "redirect:/admin/adInsert?error";
	    }
	    
	    return "redirect:/admin/adList";
	}
	
	@RequestMapping("/adDetail")
	private void adDetail(AdvertisementDTO dto, Model m) {
		// TODO Auto-generated method stub
		AdvertisementDTO adDetail = adminService.getAdById(dto);
		m.addAttribute("adDetail", adDetail);

	}
	

	@RequestMapping("/adminNoticeDetail")
	private void adminNoticeDetail(NoticeDTO dto, Model m) {
		// TODO Auto-generated method stub
		NoticeDTO notice = adminService.getNoticeById(dto);
		m.addAttribute("notice", notice);
	}

	@RequestMapping("/blamedList")
	public void blamedList() {

	}

}
