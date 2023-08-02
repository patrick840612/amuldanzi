package com.amuldanzi.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

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
import com.amuldanzi.domain.CommBlameDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.domain.EducationDTO;
import com.amuldanzi.domain.NoticeDTO;
import com.amuldanzi.domain.QnaDTO;
import com.amuldanzi.persistence.CommerceRepository;
import com.amuldanzi.service.AdminService;
import com.amuldanzi.util.MD5Generator;
import com.amuldanzi.util.MariaDBToElasticCareSearch;
import com.amuldanzi.util.MariaDBToElasticNoticeSearch;
import com.amuldanzi.util.MariaDBToElasticSearch;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	private MariaDBToElasticNoticeSearch dbToElasticsearch;
	
	@Autowired
	private MariaDBToElasticCareSearch careDbToElasticsearch;
	
	

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

        if (cateId == 0) {
            NoticeDTO noticeDetail = adminService.getNoticeById(ndto);
            m.addAttribute("noticeDetail", noticeDetail);
        } else if (cateId == 2) {
            EducationDTO eduDetail = adminService.getEduById(edto);
            m.addAttribute("eduDetail", eduDetail);
            // 교육 정보에 해당하는 이미지와 동영상의 이름을 전달
            m.addAttribute("imageName", eduDetail.getImg());
            m.addAttribute("videoName", eduDetail.getVideo());
        } else if (cateId == 3) {
            CareDTO careDetail = adminService.getCareById(cdto);
            m.addAttribute("careDetail", careDetail);
            // 케어 정보에 해당하는 이미지와 동영상의 이름을 전달
            m.addAttribute("imageName", careDetail.getImg());
            m.addAttribute("videoName", careDetail.getVideo());
        }
    }

	@RequestMapping(value = "/noticeSave", method = RequestMethod.POST)
	public String noticeSave(NoticeDTO dto) {
		BoardCategoryDTO category = new BoardCategoryDTO(0, "공지");
		dto.setBoardCate(category);
		dto.setCount(0);
		adminService.noticeSave(dto);
		
		dbToElasticsearch.indexDataFromMariaDB();
		
		
		return "redirect:/admin/adminContentList";
	}
	
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO dto) {
	
		adminService.noticeUpdate(dto);
		
		dbToElasticsearch.indexDataFromMariaDB();
		
		return "redirect:/admin/adminContentList";
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(NoticeDTO dto) {

		adminService.noticeDelete(dto);

		dbToElasticsearch.deleteDataFromElasticsearch(dto.getId());
		

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
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
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
	
	
	@RequestMapping(value = "/eduUpdate", method = RequestMethod.POST)
	public String eduUpdate(@RequestParam("file") MultipartFile file, @RequestParam("videoFile") MultipartFile videoFile, EducationDTO dto) {

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
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
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
	        adminService.eduUpdate(dto);
	    
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
	            
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
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
	        
	        careDbToElasticsearch.indexDataFromMariaDB();
	        
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        System.out.println("예외 메시지: " + ex.getMessage());
	        return "redirect:/admin/adminContentInsert?error";
	    }

	    return "redirect:/admin/adminContentList";
	}
	
    @RequestMapping(value ="/careUpdate", method = RequestMethod.POST)
    public String careUpdate(@RequestParam(name = "file", required = false) MultipartFile file, @RequestParam(name = "videoFile", required = false) MultipartFile videoFile, CareDTO dto) {
        try {
            String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\care";
            String saveVideoPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\videos\\care";

            if (file != null && !file.isEmpty()) {
                // 이미지 파일이 업로드된 경우
                String oriFilename = file.getOriginalFilename();
                String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
                String filename = new MD5Generator(oriFilename).toString() + currentTimeSeconds;
                String filepath = savePath + "\\" + filename;
                file.transferTo(new File(filepath));

                dto.setImg(filename);
                dto.setImgPath(filepath);
            } else {
                // 이미지 파일이 첨부되지 않은 경우, 기존 경로를 그대로 사용
                CareDTO existingCareDetail = adminService.getCareById(dto);
                dto.setImg(existingCareDetail.getImg());
                dto.setImgPath(existingCareDetail.getImgPath());
            }

            if (videoFile != null && !videoFile.isEmpty()) {
                // 동영상 파일이 업로드된 경우
                String oriVideoFilename = videoFile.getOriginalFilename();
                String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
                String videofilename = new MD5Generator(oriVideoFilename).toString() + currentTimeSeconds;
                String videofilepath = saveVideoPath + "\\" + videofilename;
                videoFile.transferTo(new File(videofilepath));

                dto.setVideo(videofilename);
                dto.setVideoPath(videofilepath);
            } else {
                // 동영상 파일이 첨부되지 않은 경우, 기존 경로를 그대로 사용
                CareDTO existingCareDetail = adminService.getCareById(dto);
                dto.setVideo(existingCareDetail.getVideo());
                dto.setVideoPath(existingCareDetail.getVideoPath());
            }

            // 데이터베이스에 저장
            adminService.careUpdate(dto);
            
            careDbToElasticsearch.indexDataFromMariaDB();

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
		
		careDbToElasticsearch.deleteDataFromElasticsearch(dto.getId());
		
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
				

				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
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
				
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
				String filepath =  savePath + "/" + filename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				file.transferTo(new File(filepath));				
			
				dto.setImg(filename);
				dto.setImgPath(filepath);
				
				

			}
			
			adminService.adUpdate(dto);	
	        
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



	// 이미지 삭제 메서드
	@DeleteMapping("/deleteImage")
	@ResponseBody
	private void deleteImage(@RequestParam("imageName") String imageName, @RequestParam("cateId") Integer cateId) {
	    
		try {
	        String imagePath = null;
	        switch (cateId) {
	            case 2:
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/edu/" + imageName;
	                break;
	            case 3:
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/care/" + imageName;
	                break;
	            case 8:
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/ad/" + imageName;
	                break;
	            case 9:
	                imagePath = System.getProperty("user.dir") + "/src/main/resources/static/images/commerce/" + imageName;
	                break;    
	        }

	        File imageFile = new File(imagePath);
	        if (imageFile.exists()) {
	            if (imageFile.delete()) {
	                System.out.println("이미지 삭제 성공: " + imageName);
	                // 이미지 정보를 이미지 테이블에서도 삭제합니다.
	                adminService.deleteImage(cateId, imageName);
	            } else {
	                System.out.println("이미지 삭제 실패: " + imageName);
	            }
	        } else {
	            System.out.println("이미지 파일이 존재하지 않습니다: " + imageName);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        System.out.println("예외 메시지: " + ex.getMessage());
	    }
		
		System.out.println("삭제작업끝");
	}

	// 동영상 삭제 메서드
	@DeleteMapping("/deleteVideo")
	@ResponseBody
	private void deleteVideo(String videoName, Integer cateId) {
	    try {
	        String videoPath = null;
	        switch (cateId) {
	            case 2:
	                videoPath = System.getProperty("user.dir") + "/src/main/resources/static/videos/edu/" + videoName;
	                break;
	            case 3:
	                videoPath = System.getProperty("user.dir") + "/src/main/resources/static/videos/care/" + videoName;
	                break;
	            case 8:
	            	videoPath = System.getProperty("user.dir") + "/src/main/resources/static/images/ad/" + videoName;
	                break;
	            case 9:
	            	videoPath = System.getProperty("user.dir") + "/src/main/resources/static/images/commerce/" + videoName;
	                break;    
	            default:
	                System.out.println("잘못된 카테고리 ID입니다");
	                return; // 잘못된 카테고리 ID를 제공하면 메서드를 종료합니다.
	        }

	        File videoFile = new File(videoPath);
	        if (videoFile.exists()) {
	            if (videoFile.delete()) {
	                System.out.println("동영상 삭제 성공: " + videoName);
	                // 동영상 정보를 동영상 테이블에서도 삭제합니다.
	                adminService.deleteVideo(cateId, videoName);
	            } else {
	                System.out.println("동영상 삭제 실패: " + videoName);
	            }
	        } else {
	            System.out.println("동영상 파일이 존재하지 않습니다: " + videoName);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        System.out.println("예외 메시지: " + ex.getMessage());
	    }
	}

	
	@RequestMapping(value = "/commerceSave", method = RequestMethod.POST)
	public String commerceSave(@RequestParam("file") MultipartFile file, @RequestParam("detailFile") MultipartFile detailFile, CommerceDTO dto) {		
		
	    try {
	    	
			String savePath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\commerce";
			String saveDetailPath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\commerceDetail";
			
			if(!new File(savePath).exists()) {

				new File(savePath).mkdir(); //카테고리별로 파일을 만들어 관리

			}
			
			if(!new File(saveDetailPath).exists()) {

				new File(saveDetailPath).mkdir(); //카테고리별로 파일을 만들어 관리

			}
			
	    
	    	String oriFilename = file.getOriginalFilename();
	    	
			
			if(oriFilename !=null && !oriFilename.equals("")) {
				
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
				String filepath =  savePath + "\\" + filename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				file.transferTo(new File(filepath));				
			
				dto.setImg(filename);
				dto.setImgPath(filepath);			
	            
	        }
			
			String oriDetailFilename = detailFile.getOriginalFilename();			
			
			if(oriDetailFilename !=null && !oriDetailFilename.equals("")) {
				
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String detailfilename = new MD5Generator(oriDetailFilename).toString()+ currentTimeSeconds;
				String detailfilepath =  saveDetailPath + "\\" + detailfilename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				detailFile.transferTo(new File(detailfilepath));				
			
				dto.setDetailImg(detailfilename);
				dto.setDetaiImgPath(detailfilepath);			
	            
	        }
	        
			adminService.commerceSave(dto);
			
	    } catch (Exception ex) {
	    	
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        return "redirect:/admin/commerceInsert?error";
	    }
	    
	    return "redirect:/admin/commerceList";
	}
	
	@RequestMapping("/commerceDetail")
	public void commerceDetail(CommerceDTO dto, Model m) {
		
		CommerceDTO commerceDetail = adminService.getCommerceById(dto);
		m.addAttribute("commerceDetail", commerceDetail);
		
	}
	
	@RequestMapping(value = "/commerceUpdate", method = RequestMethod.POST)
	public String commerceUpdate(@RequestParam("file") MultipartFile file, @RequestParam("detailFile") MultipartFile detailFile, CommerceDTO dto) {		
		
	    try {
	    	
			String savePath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\commerce";
			String saveDetailPath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\images\\commerceDetail";
			
			if(!new File(savePath).exists()) {

				new File(savePath).mkdir(); //카테고리별로 파일을 만들어 관리

			}
			
			if(!new File(saveDetailPath).exists()) {

				new File(saveDetailPath).mkdir(); //카테고리별로 파일을 만들어 관리

			}
			
	    
	    	String oriFilename = file.getOriginalFilename();
	    	
			
			if(oriFilename !=null && !oriFilename.equals("")) {
				
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String filename = new MD5Generator(oriFilename).toString()+ currentTimeSeconds;
				String filepath =  savePath + "\\" + filename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				file.transferTo(new File(filepath));				
			
				dto.setImg(filename);
				dto.setImgPath(filepath);			
	            
	        }
			
			String oriDetailFilename = detailFile.getOriginalFilename();			
						
			if(oriDetailFilename !=null && !oriDetailFilename.equals("")) {
				
				//현재시간을 밀리초단위로 받아와서 currentTimeSeconds에 저장
				String currentTimeSeconds = String.valueOf(System.currentTimeMillis());
				
				//받아온 시간을 파일 이름에 추가하여 중복 방지
				String detailfilename = new MD5Generator(oriDetailFilename).toString()+ currentTimeSeconds;
				String detailfilepath =  saveDetailPath + "\\" + detailfilename;

				//filepath = "기본폴더\files\zxxxxxxxxxx12233xxxxxx"

				detailFile.transferTo(new File(detailfilepath));				
			
				dto.setDetailImg(detailfilename);
				dto.setDetaiImgPath(detailfilepath);			
	            
	        }
	        
			adminService.commerceUpdate(dto);
			
	    } catch (Exception ex) {
	    	
	        ex.printStackTrace();
	        // 업로드 실패 처리
	        return "redirect:/admin/commerceUpdate?error";
	    }
	    
	    return "redirect:/admin/commerceList";
	}
	
	
	@RequestMapping("/commerceList")
	public void commerceList(Model m) {
		
		List<CommerceDTO> commerceList = adminService.getCommerceList();
		m.addAttribute("commerceList", commerceList);
		
	}
	
	@RequestMapping("/commerceDelete")
	public String commerceDelete(CommerceDTO dto) {
		adminService.commerceDelete(dto);
		return "redirect:/admin/commerceList";
		
	}

	@RequestMapping("/blamedList")
	public String blamedList(Model m, Integer commNo) {
		List<Map<String, Object>> blamedList = adminService.getCommunityListByBlamedId();		
		
		m.addAttribute("blamedList", blamedList);		
		
		System.out.println(blamedList);
		
		return "/admin/blamedList";
	}
	
	@RequestMapping("/blamedDetail")
	public String blamedDetail(Integer commNo, Model m) {
		
		CommunityDTO community = adminService.getCommunityByNo(commNo);
		List<String> commImage = adminService.getCommImagesByNo(commNo);
		
		m.addAttribute("community", community);
		m.addAttribute("commImage", commImage);
		
		return "/admin/blamedDetail";
	}
	
	@RequestMapping("/blamedDelete")
	public String blamedDelete(Integer commNo) {	  
		
	    // 싫어요 정보 삭제
		adminService.blamedDeleteByCommNo(commNo);	   
		// 이미지 데이터 베이스 삭제
		adminService.imgDeleteByCommNO(commNo);
		// 커뮤니티 글 삭제
		adminService.commDeleteByCommNo(commNo);
		
		return "/admin/blamedList";
	}
	
	@RequestMapping("/qnaList")
	public void qnaList(Model m) {
		
		List<QnaDTO> qnaList = adminService.getQnaList();
		
		m.addAttribute("qnaList", qnaList);
		
	}

}
