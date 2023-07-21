package com.amuldanzi.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.CommImageDTO;
import com.amuldanzi.domain.CommLikeDTO;
import com.amuldanzi.domain.CommunityDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.service.CommImageService;
import com.amuldanzi.service.CommuityService;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.MemberService;
import com.amuldanzi.util.MD5Generator;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
		@Autowired
		private LoginService loginService;
		
		@Autowired
		private HttpServletRequest request; 
		
		@Autowired
		private CommuityService communityService;
	
		@Autowired
		private CommImageService commImageService;
		
		@Autowired
		private MemberService memberService;
		
	
		// 커뮤니티 리스트 불러오기 
		@RequestMapping("/communityList")
		public String communityList(Model m) throws InterruptedException {
			
			// Service 를 통해 커뮤니티 리스트를 불러옴 
			List<HashMap<String, Object>> result = communityService.selectCommunityList();
			
			// 뷰에서 데이터를 사용하기위해 모델에 담음
			m.addAttribute("communityList",result); 
			
			// 파일 업로드를 위해 2.5초동안 지연 시킴
			Thread.sleep(2500); 
			
			return "/community/communityList";
			
		}
		
		// 페이지 이동시 회원역할에 따른 헤더 변경하기 함수
		private Map<String,Object> headerChange() {
			Map<String,Object> map = new HashMap<String, Object>();
	        Cookie[] cookies = request.getCookies();
	        String accessToken = null;
	        
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("access_token".equals(cookie.getName())) {
	                    accessToken = cookie.getValue();
	                    break;
	                }
	            }
	        }

			if(accessToken != null) {
		        String id = (String)loginService.getClaims(accessToken).get("id");
		        String memberRole = (String)loginService.getClaims(accessToken).get("memberRole");
		        map.put("memberRole", memberRole);
		        map.put("id", id);

			}else {
		        map.put("memberRole", "");
		        map.put("id", "");

			}
			return map;
			
		}// 페이지 이동시 회원역할에 따른 헤더 변경하기 끝
		
		// 인서트 페이지 매핑 
		@RequestMapping("/communityInsert")
		public void communityInsert(Model m) {
			
			Map<String,Object> map = headerChange();
	        m.addAttribute("id", map.get("id"));
			
			
		} 
		
		@PostMapping("/submit")
		public String submitCommunity(CommunityDTO dto, @RequestParam("files") MultipartFile[] files) {
			
		try {
			 
			System.out.println("*********submit호출 ************");
			System.out.println("<"+dto.getMemberId().getId());
			
			// MemberInfoDTO 인스턴스를 데이터베이스에서 조회
			MemberInfoDTO memberDto = memberService.findById(dto.getMemberId().getId());
			
			System.out.println("<<"+memberDto);
			
			// 조회된 회원 정보 없으면 에러페이지로 리다이렉트 
			if (memberDto == null) {
			    System.out.println("Invalid memberId: " + dto.getMemberId().getId());
			    return "redirect:/error";  // 에러 페이지로 리다이렉트
			}

			// 커뮤니티 데이터에 해당하는 회원 정보 설정
			dto.setMemberId(memberDto);
			System.out.println(memberDto);
			
			// 이미지 파일을 저장할 경로 설정 
			String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\community";
			if(!new File(savePath).exists()) {
				
				new File(savePath).mkdir();
			}
			
			List<CommImageDTO> fileDtos = new ArrayList<>();
			
			// 업로드된 파일 처리 
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
		
		// 디테일 페이지 불러오기 
		@RequestMapping("/communityDetail")
		private String  communityDetail(Integer comm_no, Model model) { 
			
			///System.out.println("Detail 호출: " + comm_no);
			//System.out.println("***************");
			CommunityDTO community = communityService.getCommunityByNo(comm_no);

			List<String> commImages = commImageService.getCommImagesByNo(comm_no);
			
			model.addAttribute("community", community); 
			//System.out.println(community); 
	        model.addAttribute("commImages", commImages); 
	        //System.out.println(commImages);
	        Map<String,Object> map = headerChange();
	        model.addAttribute("id", map.get("id"));
	        
	        return "/community/communityDetail";
			 
		}
		
		// 게시글 수정하기 
		@GetMapping("/communityModify")
		public String communityModifyPage(Integer comm_no, Model model) {
			 
			// 커뮤니티 번호르 파라미터로 받아서 해당 번호의 커뮤니티 정보를 조회
		    CommunityDTO community = communityService.getCommunityByNo(comm_no);
		    
		    // 커뮤니티 번호에 해당하는 이미지 파일 경로들 가져오기 
		    List<String> commImages = commImageService.getCommImagesByNo(comm_no);
		    
		    // 두개의 정보 모델에 담기 
		    model.addAttribute("community", community);
		    model.addAttribute("commImages", commImages);
		    
		    return "/community/communityModify"; // 수정 페이지의 JSP 이름을 적절히 변경해야 합니다.
		}
		
		
		// 게시글 수정하기 -> 현재 업로드된 이미지 삭제하기 
		@DeleteMapping("/deleteImage")
		@ResponseBody
		public void deleteImage(String imageName) {
			
			
			  
			try {
				
				System.out.println("*****************delete 호출*************");
				System.out.println(imageName);  
				
				// 현재 실행중인 사용자 디렉토리 
				String userDir = System.getProperty("user.dir");
				
				// 이미지 파일 전체 경로 생성
				String imagePath = userDir + "/src/main/resources/static/images/community/" + imageName;
				File file = new File(imagePath);
			
				// 이미지 파일이 존재하고, 삭제가 성공적으로 수행되면 
				if (file.exists() && file.delete()) {
				    System.out.println("이미지 삭제 성공: " + imageName);
				    // 이미지 정보를 이미지 테이블에서도 삭제
				    commImageService.deleteImage(imageName);
				} else {
					
				    System.out.println("이미지 삭제 실패: " + imageName); 
				    
				} 
			}catch (Exception e) {
		        System.out.println("이미지 삭제 중 오류 발생: " + imageName);
		        e.printStackTrace(); // 또는 로깅 프레임워크를 사용하여 예외 정보 기록
		        // 오류 처리 로직 추가
		    }
			
			System.out.println("삭제작업끝");
		}
		
		// 수정 버튼 클릭시 게시글 수정
		@PostMapping("/modify")
		public String modifyCommunity(CommunityDTO dto,
		                              @RequestParam("files") MultipartFile[] files,
		                              Integer comm_no,
		                              String commTitle,
		                              String commContent) {

			 
		    // 커뮤니티 글 수정 로직 수행
			// comm_no , commTitle , commContent 을 사용하여 커뮤니티 글 수정
		    communityService.modifyCommunity(comm_no, commTitle, commContent);

		    try {
		    	
		    	System.out.println("****************** modify 호출 *************");
		        // memberId를 사용하여 MemberInfoDTO를 데이터베이스에서 조회
		        MemberInfoDTO memberDto = memberService.findById(dto.getMemberId().getId());

		        if (memberDto == null) {
		            System.out.println("Invalid memberId: " + memberDto);
		            return "redirect:/error"; // 에러 페이지로 리다이렉트
		        }
		        // 조회한 회원 정보 커뮤니티 데이터 설정
		        dto.setMemberId(memberDto);

		        // 이미지 파일 저장 경로 설정 
		        String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\community";
		        if (!new File(savePath).exists()) {
		            new File(savePath).mkdir();
		        }

		        List<CommImageDTO> fileDtos = new ArrayList<>();
		         
		        // 업로드된 파일 처리
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
		public String deleteCommunity(@RequestParam("comm_no") Integer comm_no) throws InterruptedException {
		    
			System.out.println("delete 호출  ************** ");
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
		    // 좋아요 정보 먼저 삭제 
		    communityService.deleteLikeInfo(comm_no); 
		    // 싫어요 정보 먼저 삭제 
		    communityService.deleteBlameInfo(comm_no);
		    // 이미지 데이터 베이스 삭제
		    commImageService.deleteImagesByCommunityNo(comm_no);
		    // 게시글 삭제 로직 구현
		    communityService.deleteCommunity(comm_no); 
		    		    		    
		    return "redirect:/community/communityList"; // 삭제 후 게시글 목록 페이지로 리다이렉트
		}
  
		
		// 좋아요 버튼 구현
		@PostMapping("/like")
		@ResponseBody
		public String CommLike(String commNo, String commMemberId) {
			
			
			System.out.println("*-********* like 호출 ***************");
			System.out.println(commMemberId); 
			System.out.println("***********************************");
			
			CommLikeDTO commLike = new CommLikeDTO(); 
			
			// commNo에 해당하는 CommunityDTO 객체 조회
			CommunityDTO community = communityService.getCommunityByCommNo(commNo);
			// commMemberId에 해당하는 MemberInfoDTO 객체 조회
			MemberInfoDTO member = memberService.getMemberInfoById(commMemberId);
			
			// 커뮤니티 글에 좋아요 정보 저장
			communityService.saveLike(commNo, commMemberId);  
			
			
			return "redirect:/community/communityDetail?comm_no=" + commNo;
			 
		}  
		
		
		// 좋아요버튼 한번 더 누르면 좋아요 횟수 철회 구현
		@DeleteMapping("/unlike")
		@ResponseBody
		public void CommUnlike(String commNo, String commMemberId) {
		
			// 저장정보 삭제 
			communityService.deleteCommUnlike(commNo, commMemberId);
			  
		}
		
		
		// 좋아요 수 구현
		@GetMapping("/likeCount")
		@ResponseBody
		public Map<String, Integer> getLikeCount(@RequestParam("commNo") Integer commNo) {
			  
			Integer likeCount = communityService.getCommLikeCount(commNo);

			  // 좋아요 갯수를 Map에 담아서 반환
			  Map<String, Integer> result = new HashMap<>();
			  result.put("likeCount", likeCount);
			  
			  System.out.println(likeCount);
			  
			  return result;
			} 
		
		//신고 버튼 구현 
		@PostMapping("/blame")
		@ResponseBody
		public String Commblame(String commNo, String commMemberId) {
			
			System.out.println("*-********* blame 호출 ***************");
			System.out.println(commMemberId); 
			System.out.println("***********************************");
			
			CommLikeDTO commLike = new CommLikeDTO(); 
			
			// commNo에 해당하는 CommunityDTO 객체 조회
			CommunityDTO community = communityService.getCommunityByCommNo(commNo);
			// commMemberId에 해당하는 MemberInfoDTO 객체 조회
			MemberInfoDTO member = memberService.getMemberInfoById(commMemberId);
			
			communityService.saveBlame(commNo, commMemberId);  
			
			return "redirect:/community/communityDetail?comm_no=" + commNo;
			 
		}  
		
		//신고 취소 구현 
		@DeleteMapping("/unblame")
		@ResponseBody
		public void CommUnblame(String commNo, String commMemberId) {
		
			communityService.CommUnblame(commNo, commMemberId);
			  
		}
		
		
		// 신고 횟수 출력
		@GetMapping("/blameCount")
		@ResponseBody
		public Map<String, Integer> getBlameCount(@RequestParam("commNo") Integer commNo) {
			  
			Integer blameCount = communityService.getBlameCount(commNo);

			  // 좋아요 갯수를 Map에 담아서 반환
			  Map<String, Integer> result = new HashMap<>();
			  result.put("blameCount", blameCount);
			  
			  System.out.println(blameCount);
			  
			  return result;
			} 
		
		// 댓글 입력하기 
		@PostMapping("/addReply")
		@ResponseBody
		public String addReply(String commNo, String memberId, String replyContent) {
			
			System.out.println("*-********* reply 호출 ***************");
			System.out.println(commNo);
			System.out.println(memberId); 
			System.out.println(replyContent);
			System.out.println("***********************************");
			
			CommLikeDTO commLike = new CommLikeDTO(); 
			
			// commNo에 해당하는 CommunityDTO 객체 조회
			CommunityDTO community = communityService.getCommunityByCommNo(commNo);
			// commMemberId에 해당하는 MemberInfoDTO 객체 조회
			MemberInfoDTO member = memberService.getMemberInfoById(memberId);
			
			//입력정보 저장 하기 
			communityService.saveReply(commNo, memberId, replyContent);  
			
			return "redirect:/community/communityDetail?comm_no=" + commNo;
			
			
		}
		
		// 댓글 리스트 불러오기 
		@GetMapping("/getReplies")
		@ResponseBody
		public List<HashMap<String, Object>> getReplies(String commNo, Model m) { 
			
			// 커뮤니티 글 번호 사용 해당 커뮤니티 글 정보 조회 
			CommunityDTO community = communityService.getCommunityByCommNo(commNo);
			
			// 글 번호 조회한 게시글의 정보 조회 replyAll 에 저장 
			List<HashMap<String, Object>> replyAll = communityService.selectReply(commNo); 
			
			// 데이터를 jsp 에서 사용할 수 있게 만들기 
			m.addAttribute("replyAll", replyAll); 
			
			return  replyAll;
		}
		
		// 댓글 삭제하기 
		@DeleteMapping("/deleteReply")
		@ResponseBody
		public void deleReply(String commNo, String replyNo) {
			
			System.out.println("deleteReply 호출 *********************");
			System.out.println(commNo);
			System.out.println(replyNo); 
			
			communityService.deleteReply(commNo, replyNo);
			
			
		}
		
		// 댓글 수 반환 
		@GetMapping("/replyCount")
		@ResponseBody
		public Map<String, Integer> replyCount(@RequestParam("commNo") Integer commNo) {
			  
			Integer replyCount = communityService.getreplyLikeCount(commNo);

			  // 좋아요 갯수를 Map에 담아서 반환
			  Map<String, Integer> result = new HashMap<>();
			  result.put("replyCount", replyCount);
			  
			  System.out.println(replyCount);
			  
			  return result;
			} 
		
		
}
