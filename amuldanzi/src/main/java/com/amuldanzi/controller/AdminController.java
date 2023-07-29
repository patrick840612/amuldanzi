package com.amuldanzi.controller;

import java.io.File;
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

	@RequestMapping("/adminContentCate")
	@ResponseBody
	public List adminContentCate(@RequestParam("cateId") Integer cateId) {
		System.out.println("컨트롤러 요청: " + cateId);

		List list = adminService.getListByCateId(cateId);

		return list;
	}
	
	@RequestMapping("/adminContentList")
	public void adminCateList(Model m) {

		List<NoticeDTO> list = adminService.getNoticeList();
		m.addAttribute("list", list);

	}
	

	@RequestMapping("/adminContentInsert")
	public void adminContentInsert() {

	}
	
	@RequestMapping("/adminContentDetail")
	public void adminContentDetail(@RequestParam("cateId") Integer cateId, EducationDTO edto, CareDTO cdto, NoticeDTO ndto, Model m) {
		
		if(cateId == 0) {
			NoticeDTO noticeDetail = adminService.getNoticeById(ndto);
			m.addAttribute("noticeDetail", noticeDetail);			
		}else if(cateId == 2) {
			EducationDTO eduDetail = adminService.getEduById(edto);
			m.addAttribute("eduDetail", eduDetail);			
		}else if(cateId == 3) {
			CareDTO careDetail = adminService.getCareById(cdto);
			m.addAttribute("careDetail", careDetail);
		}
		
		
	}

	@RequestMapping(value = "/noticeSave", method = RequestMethod.POST)
	public String noticeSave(NoticeDTO dto) {
		BoardCategoryDTO category = new BoardCategoryDTO(0, "공지");
		dto.setBoardCate(category);
		dto.setCount(0);
		adminService.noticeSave(dto);
		return "redirect:/admin/adminContentList";
	}

	
	@RequestMapping("/adminNoticeDetail")
	private void adminNoticeDetail(NoticeDTO dto, Model m) {
		// TODO Auto-generated method stub
		NoticeDTO notice = adminService.getNoticeById(dto);
		m.addAttribute("notice", notice);
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(NoticeDTO dto) {

		adminService.noticeDelete(dto);
		return "redirect:/admin/adminContentList";
	}

	
	@RequestMapping(value = "/eduSave", method = RequestMethod.POST)
	public String eduSave(@RequestParam("file") MultipartFile file, @RequestParam("videoFile") MultipartFile videoFile, EducationDTO dto) {
		
		BoardCategoryDTO category = new BoardCategoryDTO(2, "교육정보");
		dto.setBoardCate(category);
		dto.setCount(0);
		try {
	        String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\edu";
	        String saveVideoPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\videos\\edu";

	        if (!new File(savePath).exists()) {
	            new File(savePath).mkdir(); // 이미지 폴더 생성
	        }

	        if (!new File(saveVideoPath).exists()) {
	            new File(saveVideoPath).mkdir(); // 비디오 폴더 생성
	        }

	        String oriFilename = file.getOriginalFilename();
	        String oriVideoFilename = videoFile.getOriginalFilename();

	        if (oriFilename != null && !oriFilename.equals("")) {
	            String filename = new MD5Generator(oriFilename).toString();
	            String filepath = savePath + "\\" + filename;
	            file.transferTo(new File(filepath));

	            dto.setImg(filename);
	            dto.setImgPath(filepath);
	        }

	        if (oriVideoFilename != null && !oriVideoFilename.equals("")) {
	            String videofilename = new MD5Generator(oriVideoFilename).toString();
	            String videofilepath = saveVideoPath + "\\" + videofilename;
	            videoFile.transferTo(new File(videofilepath)); // 수정: 동영상 파일 저장

	            dto.setVideo(videofilename); // 수정: 동영상 파일명을 설정
	            dto.setVideoPath(videofilepath); // 수정: 동영상 파일 경로를 설정
	        }

	        // 데이터베이스에 저장
	        System.out.println(dto.toString());
	        adminService.eduSave(dto);
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        System.out.println("예외 메시지: " + ex.getMessage());
	        return "redirect:/admin/adminContentInsert?error";
	    }

	    return "redirect:/admin/adminContentList";
	}
	
	@RequestMapping("/eduDelete")
	public String eduDelete(EducationDTO dto) {

		adminService.eduDelete(dto);
		return "redirect:/admin/adminContentList";
	}


	@RequestMapping(value = "/careSave", method = RequestMethod.POST)
	public String careSave(@RequestParam("file") MultipartFile file, @RequestParam("videoFile") MultipartFile videoFile, CareDTO dto) {
	    BoardCategoryDTO category = new BoardCategoryDTO(3, "케어정보");
	    dto.setBoardCate(category);
	    dto.setCount(0);

	    try {
	        String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\care";
	        String saveVideoPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\videos\\care";

	        if (!new File(savePath).exists()) {
	            new File(savePath).mkdir(); // 이미지 폴더 생성
	        }

	        if (!new File(saveVideoPath).exists()) {
	            new File(saveVideoPath).mkdir(); // 비디오 폴더 생성
	        }

	        String oriFilename = file.getOriginalFilename();
	        String oriVideoFilename = videoFile.getOriginalFilename();

	        if (oriFilename != null && !oriFilename.equals("")) {
	            String filename = new MD5Generator(oriFilename).toString();
	            String filepath = savePath + "\\" + filename;
	            file.transferTo(new File(filepath));

	            dto.setImg(filename);
	            dto.setImgPath(filepath);
	        }

	        if (oriVideoFilename != null && !oriVideoFilename.equals("")) {
	            String videofilename = new MD5Generator(oriVideoFilename).toString();
	            String videofilepath = saveVideoPath + "\\" + videofilename;
	            videoFile.transferTo(new File(videofilepath)); // 수정: 동영상 파일 저장

	            dto.setVideo(videofilename); // 수정: 동영상 파일명을 설정
	            dto.setVideoPath(videofilepath); // 수정: 동영상 파일 경로를 설정
	        }

	        // 데이터베이스에 저장
	        adminService.careSave(dto);
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        System.out.println("예외 메시지: " + ex.getMessage());
	        return "redirect:/admin/adminContentInsert?error";
	    }

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
	
	@RequestMapping("/adDetail")
	private void adDetail(AdvertisementDTO dto, Model m) {
		// TODO Auto-generated method stub
		AdvertisementDTO adDetail = adminService.getAdById(dto);
		m.addAttribute("adDetail", adDetail);

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

	@RequestMapping("/adDelete")
	private String adDelete(AdvertisementDTO dto) {
		// TODO Auto-generated method stub
		adminService.adDelete(dto);		
		
		return "redirect:/admin/adList";
	}



	//현재 업로드된 이미지 삭제하기 
	@DeleteMapping("/deleteImage")
	@ResponseBody
	public void deleteImage(String imageName, String videoName, Integer cateId) {		
	    try {
	        System.out.println("*****************delete 호출*************");
	        System.out.println(imageName);  

	        // 이미지와 동영상 파일을 삭제하기 위한 경로 설정
	        String imagePath = null;
	        String videoPath = null;
	        
	        if (cateId == null) {
	        	cateId = 9; // 기본 값으로 "ad"
	        }        

	        switch (cateId) {
	            case 2 :
	                // 카테고리 1에 해당하는 이미지 경로 설정
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/edu/" + imageName;
	                // 카테고리 1에 해당하는 동영상 경로 설정
	                videoPath = System.getProperty("user.dir") + "/src/main/resources/static/videos/edu/" + videoName;
	                break;
	            case 3 :
	                // 카테고리 2에 해당하는 이미지 경로 설정
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/care/" + imageName;
	                // 카테고리 2에 해당하는 동영상 경로 설정
	                videoPath = System.getProperty("user.dir") + "/src/main/resources/static/videos/care/" + videoName;
	                break;
	            // 필요에 따라 다른 카테고리에 대한 case를 추가할 수 있습니다.
	            case 9:
	                // ad 이미지 경로 설정
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/ad/" + imageName;            
	                videoPath = System.getProperty("user.dir") + "/src/main/resources/static/videos/ad/" + videoName;
	                break;
	        }

	        // 이미지 삭제 처리
	        File imageFile = new File(imagePath);
	        if (imageFile.exists()) {
	            if (imageFile.delete()) {
	                System.out.println("이미지 삭제 성공: " + imageName);
	                // 이미지 정보를 이미지 테이블에서도 삭제
	                adminService.deleteImage(cateId, imageName);
	            } else {
	                System.out.println("이미지 삭제 실패: " + imageName); 
	            } 
	        } else {
	            System.out.println("이미지 파일이 존재하지 않습니다: " + imageName); 
	        }

	        // 동영상 삭제 처리
	        File videoFile = new File(videoPath);
	        if (videoFile.exists()) {
	            if (videoFile.delete()) {
	                System.out.println("동영상 삭제 성공: " + videoName);
	                // 동영상 정보를 동영상 테이블에서도 삭제 (동영상 정보를 저장하는 테이블이 있다면 해당 로직 추가)
	            } else {
	                System.out.println("동영상 삭제 실패: " + videoName); 
	            }
	        } else {
	            System.out.println("동영상 파일이 존재하지 않습니다: " + videoName); 
	        }

	    } catch (Exception e) {
	        System.out.println("이미지 및 동영상 삭제 중 오류 발생: " + imageName);
	        e.printStackTrace(); // 또는 로깅 프레임워크를 사용하여 예외 정보 기록
	        // 오류 처리 로직 추가
	    }
	    System.out.println("삭제작업끝");
	}
	

	
	
	

	



	@RequestMapping("/blamedList")
	public void blamedList() {

	}

}
