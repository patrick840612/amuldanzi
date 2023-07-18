package com.amuldanzi.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.IMarkerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.service.CommImageService;
import com.amuldanzi.service.CommuityService;
import com.amuldanzi.service.MemberService;
import com.amuldanzi.util.MD5Generator;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	
		@Autowired
		private CommuityService communityService;
	
		@Autowired
		private CommImageService commImageService;
		
		@Autowired
		private MemberService memberService;
		
	
		@RequestMapping("/communityList")
		public String communityList(Model m) {
			
			List<HashMap<String, Object>> result = communityService.selectCommunityList();
			
			m.addAttribute("communityList",result); 
			//System.out.println("*******************************1111111111");
		    //System.out.println(result);
		    //System.out.println("*******************************1111111111");
			return "/community/communityList";
		}
		
		@RequestMapping("/communityInsert")
		public void communityInsert() {
			
		}
		
		@PostMapping("/submit")
		public String submitCommunity(CommunityDTO dto, @RequestParam("files") MultipartFile[] files) {
			
		try {
			 
			System.out.println("*********submit호출 ************");
			System.out.println("<"+dto.getMemberId().getId());
			
			// MemberInfoDTO 인스턴스를 데이터베이스에서 조회
			MemberInfoDTO memberDto = memberService.findById(dto.getMemberId().getId());
			
			System.out.println("<<"+memberDto);

			if (memberDto == null) {
			    System.out.println("Invalid memberId: " + dto.getMemberId().getId());
			    return "redirect:/error";  // 에러 페이지로 리다이렉트
			}

			dto.setMemberId(memberDto);
			System.out.println(memberDto);
			
			String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\community";
			if(!new File(savePath).exists()) {
				
				new File(savePath).mkdir();
			}
			
			List<CommImageDTO> fileDtos = new ArrayList<>();
			
			for (int i = 0; i < files.length; i++) {
		        MultipartFile file = files[i];
		        String origFilename = file.getOriginalFilename();

		        if (file != null && !origFilename.equals("") && i < 3) {
		            String filename = new MD5Generator(origFilename).toString();
		            String filepath = savePath + "/" + filename;

		            // 파일 저장
		            file.transferTo(new File(filepath));

		            // 파일에 관련된 정보 저장
		            CommImageDTO fileDto = new CommImageDTO();
		            fileDto.setCommImgOriginName(origFilename);
		            fileDto.setCommImgFileName(filename);
		            fileDto.setCommImgPath(filepath);
		            fileDto.setCommunityNum(dto);
		            
		            fileDtos.add(fileDto);
		            
		             
		            
		        }
		    }
			
			communityService.saveCommunity(dto, fileDtos);
			System.out.println(dto);
			System.out.println(fileDtos);
		}catch(Exception ex){ 
			System.out.println("오류로 들어감");
			ex.printStackTrace();
		}
			return "redirect:/community/communityList";
			
		}
		
		
		@RequestMapping("/communityDetail")
		private String  communityDetail(Integer comm_no, Model model) { 
			
			///System.out.println("Detail 호출: " + comm_no);
			//System.out.println("***************");
			CommunityDTO community = communityService.getCommunityByNo(comm_no);

			List<String> commImages = commImageService.getCommImagesByNo(comm_no);
			
			model.addAttribute("community", community); 
			//System.out.println(community);
			//System.out.println("*********************");
	        model.addAttribute("commImages", commImages);
	        //System.out.println("이미지 ==>>>>>>>>>>>");
	        //System.out.println(commImages);
	        return "/community/communityDetail";
			 
		}
		
		@GetMapping("/communityModify")
		public String communityModifyPage(Integer comm_no, Model model) {
		    // 게시글 번호에 해당하는 게시글 정보를 가져와서 모델에 추가합니다.
		    CommunityDTO community = communityService.getCommunityByNo(comm_no);
		    List<String> commImages = commImageService.getCommImagesByNo(comm_no);
		    model.addAttribute("community", community);
		    model.addAttribute("commImages", commImages);
		    
		    return "/community/communityModify"; // 수정 페이지의 JSP 이름을 적절히 변경해야 합니다.
		}
		
		
		@DeleteMapping("/deleteImage")
		public void deleteImage(String imageName) {
			
			
			  
			try {
				
				System.out.println("*****************delete 호출*************");
				System.out.println(imageName);  
				String userDir = System.getProperty("user.dir");
				
				String imagePath = userDir + "/src/main/resources/static/images/community/files/" + imageName;
				File file = new File(imagePath);
			
			if (file.exists() && file.delete()) {
			    System.out.println("이미지 삭제 성공: " + imageName);
			    commImageService.deleteImage(imageName);
			} else {
			    System.out.println("이미지 삭제 실패: " + imageName);
			    // 실패 처리 로직 추가
				} 
			}catch (Exception e) {
		        System.out.println("이미지 삭제 중 오류 발생: " + imageName);
		        e.printStackTrace(); // 또는 로깅 프레임워크를 사용하여 예외 정보 기록
		        // 오류 처리 로직 추가
		    } 
		}
		
		@PostMapping("/modify")
		public String modifyCommunity(@RequestParam("memberId") String memberId,
		                              CommunityDTO dto,
		                              @RequestParam("files") MultipartFile[] files,
		                              Integer comm_no,
		                              String commTitle,
		                              String commContent) {

			System.out.println(memberId.getClass().getTypeName()+"\\\\\\\\\\\\\\\\\\***********");
		    // 커뮤니티 글 수정 로직 수행
		    communityService.modifyCommunity(comm_no, commTitle, commContent);

		    try {
		        // memberId를 사용하여 MemberInfoDTO를 데이터베이스에서 조회
		        MemberInfoDTO memberDto = memberService.findById(memberId);

		        if (memberDto == null) {
		            System.out.println("Invalid memberId: " + memberId);
		            return "redirect:/error"; // 에러 페이지로 리다이렉트
		        }

		        dto.setMemberId(memberDto);

		        String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\community\\files";
		        if (!new File(savePath).exists()) {
		            new File(savePath).mkdir();
		        }

		        List<CommImageDTO> fileDtos = new ArrayList<>();
		         

		        for (int i = 0; i < files.length; i++) {
		            MultipartFile file = files[i];
		            String origFilename = file.getOriginalFilename();

		            if (file != null && !origFilename.equals("") && i < 3) {
		                String filename = new MD5Generator(origFilename).toString();
		                String filepath = savePath + "/" + filename;

		                // 파일 저장
		                file.transferTo(new File(filepath));

		                // 파일에 관련된 정보 저장
		                CommImageDTO fileDto = new CommImageDTO();
		                fileDto.setCommImgOriginName(origFilename);
		                fileDto.setCommImgFileName(filename);
		                fileDto.setCommImgPath(filepath);
		                fileDto.setCommunityNum(dto);

		                fileDtos.add(fileDto);
		            }
		        }

		        // 커뮤니티 글과 이미지 정보를 저장
		        communityService.saveCommunityWithImages(dto, fileDtos, comm_no);

		    } catch (Exception ex) {
		        System.out.println("오류로 들어감");
		        ex.printStackTrace();
		    }

		    return "redirect:/community/communityList";
		}
		
		@PostMapping("/delete")
		public String deleteCommunity(@RequestParam("comm_no") Integer comm_no) {
		    
			System.out.println(comm_no); 
		    
		    // 이미지 삭제 로직 구현
		    List<String> imagePaths = commImageService.getImagePathsByCommunityNo(comm_no);
		    System.out.println(imagePaths); 
		    for (String imagePath : imagePaths) {

		    	// 이미지 파일 삭제 로직 구현
			    File file = new File(imagePath);
			    
			    if (file.exists()) {
			        if (file.delete()) {
			            System.out.println("이미지 파일 삭제 성공: " + imagePath);
			        } else {
			            System.out.println("이미지 파일 삭제 실패: " + imagePath);
			            // 실패 처리 로직 추가
			        }
			    } else {
			        System.out.println("이미지 파일이 존재하지 않습니다: " + imagePath);
			        // 존재하지 않는 파일 처리 로직 추가
			    }
		    	
		    }
		    
		    commImageService.deleteImagesByCommunityNo(comm_no);
		    
		    // 게시글 삭제 로직 구현
		    communityService.deleteCommunity(comm_no);
		    
		    return "redirect:/community/communityList"; // 삭제 후 게시글 목록 페이지로 리다이렉트
		}
 
		
		
		
		
}
