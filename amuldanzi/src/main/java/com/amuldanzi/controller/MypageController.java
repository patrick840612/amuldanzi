package com.amuldanzi.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;
import com.amuldanzi.domain.QnaDTO;
import com.amuldanzi.domain.SitterDTO;
import com.amuldanzi.entity.MemberPetEntity;
import com.amuldanzi.entity.OrderItemsEntity2;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.MypageService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
    // RestTemplate 인스턴스 생성
    RestTemplate restTemplate;
	
	
	// 페이지 이동
	@RequestMapping("/{step}")
	public String login(@PathVariable String step, Model m) {
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        if(!map.get("id").toString().isEmpty()) {
            MemberInfoDTO member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }
        
		return "/mypage/"+step;
	}
	
	@RequestMapping("/memberinfo")
	public void memberinfo(Model m) {

		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        MemberInfoDTO member = new MemberInfoDTO();
        member.setId((String)map.get("id"));
        member = loginService.selectById(member);
        m.addAttribute("member", member);
        
        List<MemberPetDTO> pets = mypageService.selectById(member);
        m.addAttribute("pets", pets);
        
        List<MemberSocialDTO> socials = mypageService.selectSocialById(member);

        for(MemberSocialDTO social : socials) {
        	if(social.getSocial().equals("google")) {
        		m.addAttribute("google", social.getSocial());
        	}else if(social.getSocial().equals("kakao")){
        		m.addAttribute("kakao", social.getSocial());
        	}
        }
        
        if(!map.get("id").toString().isEmpty()) {
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }
	}

	// 페이지 이동시 회원역할에 따른 헤더 변경하기 정보 얻기 함수
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
	
	// 소셜 회원가입 삭제(구글)
	@RequestMapping("/deleteGoogle")
	@ResponseBody
	public void deleteGoogle(MemberSocialDTO memberSocial, MemberInfoDTO member) {
		memberSocial.setMemberId(member);
		mypageService.deleteSocial(memberSocial);
	}
	
	// 소셜 회원가입 삭제(카카오)
	@RequestMapping("/deleteKakao")
	@ResponseBody
	public void deleteKakao(MemberSocialDTO memberSocial, MemberInfoDTO member) {
		memberSocial.setMemberId(member);
		mypageService.deleteSocial(memberSocial);		
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/updateMemberInfo", method = RequestMethod.POST)
	public String updateMemberInfo(@ModelAttribute MemberInfoDTO member, @ModelAttribute MemberPetEntity pets) {

		List<MemberPetDTO> petList = new ArrayList<>();
		if (pets != null && hasPetData(pets)) {		

			// 반려동물 목록이 있으면 있는 수만큼 memberPetDTO 객체 생성하여 setter, 반려동물 없으면 없는 걸로 처리(삼항연산자)
			String[] memberPetId = (pets.getPetName() != null) ? pets.getMemberPetId().split(",") : new String[0];
	        String[] petNames = (pets.getPetName() != null) ? pets.getPetName().split(",") : new String[0];
	        String[] whichPets = (pets.getWhichPet() != null) ? pets.getWhichPet().split(",") : new String[0];
	        String[] petBloods = (pets.getPetBlood() != null) ? pets.getPetBlood().split(",") : new String[0];
	        String[] gpss = (pets.getGps() != null) ? pets.getGps().split(",") : new String[0];
			
	        if (memberPetId.length > 0) {

	            for (int i = 0; i < petNames.length; i++) {

	                MemberPetDTO memberPetDTO = new MemberPetDTO();
	                if (memberPetId[i] != null && !memberPetId[i].isEmpty()) {
	                    memberPetDTO.setMemberPetId(Integer.parseInt(memberPetId[i]));
	                }
	                memberPetDTO.setPetName(petNames[i]);
	                memberPetDTO.setWhichPet(whichPets[i]);
	                memberPetDTO.setPetBlood(petBloods[i]);
	                memberPetDTO.setGps(gpss[i]);
	                memberPetDTO.setMemberId(member);

	                petList.add(memberPetDTO);
	            }
	        }
		 }
		mypageService.updateInfo(member, petList);
		return "redirect:/main/index";
	}
	
	// MemberPetDTO pets 에 값이 있는지 확인 하는 함수
	private boolean hasPetData(MemberPetEntity pets) {
	    return pets != null &&
	        ((pets.getPetName() != null && !pets.getPetName().isEmpty()) ||
	        (pets.getWhichPet() != null && !pets.getWhichPet().isEmpty()) ||
	        (pets.getPetBlood() != null && !pets.getPetBlood().isEmpty()) ||
	        (pets.getGps() != null && !pets.getGps().isEmpty()));
	}

	@RequestMapping("/deletePet")
	@ResponseBody
	public void deletePet(MemberPetDTO pet) {
		
		if(pet.getMemberPetId() != 0) mypageService.deletePet(pet);
	}

	@RequestMapping("/petDel")
	@ResponseBody
	public void petDel(MemberInfoDTO member) {
		
		mypageService.petDel(member);
	}
	
	//썸머노트 이미지 업로드 구현(방법 1)
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
        
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		Gson gson = new Gson();
		String jsonString = gson.toJson(jsonObject);
		return jsonString;
	}
	

	// 썸머노트 이미지 삭제(백스페이스로 에디터에서 이미지 삭제시 이벤트 추적 불가 - DB값과 비교하여 스케줄링으로 구현 가능)
	@PostMapping(value = "/deleteSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public void deleteSummernoteImageFile(@RequestParam("file") String fileName) {
	    // 폴더 위치
		String fileRoot = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\";
	    
	    // 해당 파일 삭제
	    deleteFile(fileRoot, fileName);
	}

	// 파일 하나 삭제
	private void deleteFile(String fileRoot, String fileName) {

	    Path path = Paths.get(fileRoot, fileName);
	    try {
	        Files.delete(path);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	// 돌보미신청 페이지 이동
	@RequestMapping("/sitter")
	public void sitter(Model m) {
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        Optional<SitterDTO> sitter = mypageService.sitterFindById(String.valueOf(map.get("id")));
        sitter.ifPresent(sitterDTO -> {
            m.addAttribute("sitter", sitterDTO);
        });
        
        if(!map.get("id").toString().isEmpty()) {
            MemberInfoDTO member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }
	}
	
	// 돌보미 신청시 DB 저장(이미지 저장 안하기 beforeunload로 파일처리 끝냄)
	@RequestMapping(value = "/sitterRegist", method = RequestMethod.POST)
	public String sitterRegist(SitterDTO sitter, @RequestParam("editordata") String editordata) throws InterruptedException {
	    // 썸머노트 에어리어에 입력한 값에서 <p> 태그 제거
	    Document doc = Jsoup.parse(editordata);
	    String cleanText = doc.text();
	    
		if(!sitter.getSitterImg().equals("")) {
			// 이미지 파일을 저장할 경로 설정 
			String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\";
			sitter.setSitterImgPath(savePath);			
		}
		sitter.setSitterEtc(cleanText);

		mypageService.saveSitter(sitter);
		
		Thread.sleep(2500);
        return "redirect:/mypage/sitter";
    }
	
	// 돌보미 재신청시 신청 삭제
	@RequestMapping("/deleteSitter")
	public String deleteSitter(SitterDTO sitter, @RequestParam String id) {

		mypageService.sitterDeleteById(id);
		return "redirect:/mypage/sitter";
	}
	
	// 쇼핑몰신청 페이지 이동
	@RequestMapping("/business")
	public void business(@RequestParam(name = "page", defaultValue = "1") int currentPage, Model m, MemberInfoDTO member,@RequestParam(name="businessOk", defaultValue = "1") String businessOk) throws ParseException, InterruptedException{
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        boolean hasApprovalPending = false;
        boolean hasApprovalComplete = false;
        List<BusinessDTO> businessList = mypageService.businessFindByMemberId(String.valueOf(map.get("id")));

        List<HashMap<String, Object>> result1 = new ArrayList<>();
        List<HashMap<String, Object>> result2 = new ArrayList<>();
        int itemsPerPage = 3;
        
        // 승인대기와 승인완료가 있는지 검사
        for (BusinessDTO business : businessList) {
            if ("승인대기".equals(business.getBusinessOk())) {
                HashMap<String, Object> hashmap = new HashMap<>();
                hashmap.put("businessNumber", business.getBusinessNumber());
                hashmap.put("businessOk", business.getBusinessOk());
                hashmap.put("businessName", business.getBusinessName());
                hashmap.put("businessSector", business.getBusinessSector());
                hashmap.put("businessImg", business.getBusinessImg());
                hashmap.put("businessRegdate", business.getBusinessRegdate());
                hashmap.put("memberId", business.getMemberId());
                result1.add(hashmap);
                hasApprovalPending = true;
            } else if ("승인완료".equals(business.getBusinessOk())) {
                HashMap<String, Object> hashmap = new HashMap<>();
                hashmap.put("businessNumber", business.getBusinessNumber());
                hashmap.put("businessOk", business.getBusinessOk());
                hashmap.put("businessName", business.getBusinessName());
                hashmap.put("businessSector", business.getBusinessSector());
                hashmap.put("businessImg", business.getBusinessImg());
                hashmap.put("businessRegdate", business.getBusinessRegdate());
                hashmap.put("memberId", business.getMemberId());
                result2.add(hashmap);
                hasApprovalComplete = true;
            }
           
        }
        

        if (businessList.isEmpty()) {
            // 1. 리스트가 비어있는 경우
        } else if(hasApprovalPending == true && hasApprovalComplete == true){
        	m.addAttribute("business", "승인대기완료");
        	
            int totalItems1 = result1.size();
    	    int totalPages1 = (int) Math.ceil((double) totalItems1 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages1);
    	    int startIndex1 = (currentPage - 1) * itemsPerPage;
            int endIndex1 = Math.min(startIndex1 + itemsPerPage, totalItems1);
            startIndex1 = Math.max(0, startIndex1);  
            endIndex1 = Math.max(startIndex1, endIndex1);
            List<HashMap<String, Object>> business1 = new ArrayList<>();
            if (startIndex1 < result1.size() && startIndex1 <= endIndex1) {
            	business1 = result1.subList(startIndex1, endIndex1);
            }
    		m.addAttribute("totalPages1", totalPages1);
            m.addAttribute("business1", business1);
            
            
            int totalItems2 = result2.size();
    	    int totalPages2 = (int) Math.ceil((double) totalItems2 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages2);
    	    int startIndex2 = (currentPage - 1) * itemsPerPage;
            int endIndex2 = Math.min(startIndex2 + itemsPerPage, totalItems2);
            startIndex2 = Math.max(0, startIndex2);  
            endIndex2 = Math.max(startIndex2, endIndex2);
            
            List<HashMap<String, Object>> business2 = new ArrayList<>();
            if (startIndex2 < result2.size() && startIndex2 <= endIndex2) {
            	business2 = result2.subList(startIndex2, endIndex2);
            }
    		m.addAttribute("totalPages2", totalPages2);
            m.addAttribute("business2", business2);
            
            m.addAttribute("currentPage", currentPage);

        	
            m.addAttribute("businessList", businessList);
        }else if(hasApprovalPending == true && hasApprovalComplete == false) {
        	m.addAttribute("business", "승인대기");

            int totalItems1 = result1.size();
    	    int totalPages1 = (int) Math.ceil((double) totalItems1 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages1);
    	    int startIndex1 = (currentPage - 1) * itemsPerPage;
            int endIndex1 = Math.min(startIndex1 + itemsPerPage, totalItems1);
            startIndex1 = Math.max(0, startIndex1);  
            endIndex1 = Math.max(startIndex1, endIndex1);
            List<HashMap<String, Object>> business1 = new ArrayList<>();
            if (startIndex1 < result1.size() && startIndex1 <= endIndex1) {
            	business1 = result1.subList(startIndex1, endIndex1);
            }
    		m.addAttribute("totalPages1", totalPages1);
            m.addAttribute("business1", business1);
            m.addAttribute("currentPage", currentPage);
        	
            m.addAttribute("businessList", businessList);
        }else {
        	m.addAttribute("business", "승인완료");
        	
            int totalItems2 = result2.size();
    	    int totalPages2 = (int) Math.ceil((double) totalItems2 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages2);
    	    int startIndex2 = (currentPage - 1) * itemsPerPage;
            int endIndex2 = Math.min(startIndex2 + itemsPerPage, totalItems2);
            startIndex2 = Math.max(0, startIndex2);  
            endIndex2 = Math.max(startIndex2, endIndex2);
            
            List<HashMap<String, Object>> business2 = new ArrayList<>();
            if (startIndex2 < result2.size() && startIndex2 <= endIndex2) {
            	business2 = result2.subList(startIndex2, endIndex2);
            }
    		m.addAttribute("totalPages2", totalPages2);
            m.addAttribute("business2", business2);
            m.addAttribute("currentPage", currentPage);
        	
            m.addAttribute("businessList", businessList);
        }
        
        m.addAttribute("businessOk", businessOk);
        
        if(!map.get("id").toString().isEmpty()) {
            member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }
        
        Thread.sleep(2500); 
	} // 쇼핑몰 신청페이지 이동 끝
	
	// 쇼핑몰 신청
	@RequestMapping(value = "/businessRegist", method = RequestMethod.POST)
	public String businessRegist(BusinessDTO business, MemberInfoDTO member) throws InterruptedException {

		if(!business.getBusinessImg().equals("")) {
			// 이미지 파일을 저장할 경로 설정 
			String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\";
			business.setBusinessImgPath(savePath);			
		}
		business.setMemberId(member);

		mypageService.saveBusiness(business);
		
		Thread.sleep(2500);

		return "redirect:/mypage/business";
	}
	
	// 쇼핑몰 상세페이지 이동
	@RequestMapping("/businessDetail")
	public void businessDetail(Model m, MemberInfoDTO member, @RequestParam("businessNumber") String businessNumber){
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        BusinessDTO business = mypageService.businessFindByMemberRearId(businessNumber);

        
    	m.addAttribute("businessOk", business.getBusinessOk());
    	m.addAttribute("business", business);
    	
        if(!map.get("id").toString().isEmpty()) {
            member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }

	}
	
	// 쇼핑몰 수정
	@RequestMapping("/businessUpdate")
	public String businessUpdate(BusinessDTO business) {
		mypageService.businessUpdate(business);
		
		return "redirect:/mypage/business";		
	}
	
	// 쇼핑몰 삭제
	@RequestMapping("/businessDelete")
	public String businessDelete(BusinessDTO business) {
		mypageService.businessDelete(business);
		
		return "redirect:/mypage/business";		
	}
	
	// 1:1문의 페이지 이동
	@RequestMapping("/qnalist")
	public void qnalist(@RequestParam(name = "page", defaultValue = "1") int currentPage, Model m, MemberInfoDTO member,@RequestParam(name="qnaAnswerOk", defaultValue = "1") String qnaAnswerOk) throws ParseException{
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        boolean hasApprovalPending = false;
        boolean hasApprovalComplete = false;
        List<QnaDTO> qnaList = mypageService.qnaFindByMemberId(String.valueOf(map.get("id")));

        List<HashMap<String, Object>> result1 = new ArrayList<>();
        List<HashMap<String, Object>> result2 = new ArrayList<>();
        int itemsPerPage = 3;
        
        // 답변대기와 답변완료가 있는지 검사
        for (QnaDTO qna : qnaList) {
            if ("답변대기".equals(qna.getQnaAnswerOk())) {
                HashMap<String, Object> hashmap = new HashMap<>();
                hashmap.put("qnaNo", qna.getQnaNo());
                hashmap.put("qnaCategory", qna.getQnaCategory());
                hashmap.put("qnaTitle", qna.getQnaTitle());
                hashmap.put("qnaDate", qna.getQnaDate());
                hashmap.put("qnaAnswerOk", qna.getQnaAnswerOk());
                hashmap.put("qnaImg", qna.getQnaImg());
                hashmap.put("memberId", qna.getMemberId());
                result1.add(hashmap);
                hasApprovalPending = true;
            } else if ("답변완료".equals(qna.getQnaAnswerOk())) {
                HashMap<String, Object> hashmap = new HashMap<>();
                hashmap.put("qnaNo", qna.getQnaNo());
                hashmap.put("qnaCategory", qna.getQnaCategory());
                hashmap.put("qnaTitle", qna.getQnaTitle());
                hashmap.put("qnaDate", qna.getQnaDate());
                hashmap.put("qnaAnswerOk", qna.getQnaAnswerOk());
                hashmap.put("qnaImg", qna.getQnaImg());
                hashmap.put("memberId", qna.getMemberId());
                result2.add(hashmap);
                hasApprovalComplete = true;
            }
           
        }
        

        if (qnaList.isEmpty()) {
            // 1. 리스트가 비어있는 경우
        } else if(hasApprovalPending == true && hasApprovalComplete == true){
        	m.addAttribute("qna", "답변대기완료");
        	
            int totalItems1 = result1.size();
    	    int totalPages1 = (int) Math.ceil((double) totalItems1 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages1);
    	    int startIndex1 = (currentPage - 1) * itemsPerPage;
            int endIndex1 = Math.min(startIndex1 + itemsPerPage, totalItems1);
            startIndex1 = Math.max(0, startIndex1);  
            endIndex1 = Math.max(startIndex1, endIndex1);
            List<HashMap<String, Object>> qna1 = new ArrayList<>();
            if (startIndex1 < result1.size() && startIndex1 <= endIndex1) {
            	qna1 = result1.subList(startIndex1, endIndex1);
            }
    		m.addAttribute("totalPages1", totalPages1);
            m.addAttribute("qna1", qna1);
            
            
            int totalItems2 = result2.size();
    	    int totalPages2 = (int) Math.ceil((double) totalItems2 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages2);
    	    int startIndex2 = (currentPage - 1) * itemsPerPage;
            int endIndex2 = Math.min(startIndex2 + itemsPerPage, totalItems2);
            startIndex2 = Math.max(0, startIndex2);  
            endIndex2 = Math.max(startIndex2, endIndex2);
            
            List<HashMap<String, Object>> qna2 = new ArrayList<>();
            if (startIndex2 < result2.size() && startIndex2 <= endIndex2) {
            	qna2 = result2.subList(startIndex2, endIndex2);
            }
    		m.addAttribute("totalPages2", totalPages2);
            m.addAttribute("qna2", qna2);
            
            m.addAttribute("currentPage", currentPage);

        	
            m.addAttribute("qnaList", qnaList);
        }else if(hasApprovalPending == true && hasApprovalComplete == false) {
        	m.addAttribute("qna", "답변대기");

            int totalItems1 = result1.size();
    	    int totalPages1 = (int) Math.ceil((double) totalItems1 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages1);
    	    int startIndex1 = (currentPage - 1) * itemsPerPage;
            int endIndex1 = Math.min(startIndex1 + itemsPerPage, totalItems1);
            startIndex1 = Math.max(0, startIndex1);  
            endIndex1 = Math.max(startIndex1, endIndex1);
            List<HashMap<String, Object>> qna1 = new ArrayList<>();
            if (startIndex1 < result1.size() && startIndex1 <= endIndex1) {
            	qna1 = result1.subList(startIndex1, endIndex1);
            }
    		m.addAttribute("totalPages1", totalPages1);
            m.addAttribute("qna1", qna1);
            m.addAttribute("currentPage", currentPage);
        	
            m.addAttribute("qnaList", qnaList);
        }else {
        	m.addAttribute("qna", "답변완료");
        	
            int totalItems2 = result2.size();
    	    int totalPages2 = (int) Math.ceil((double) totalItems2 / itemsPerPage);
    	    // 현재 페이지 번호가 1 미만이면 1로 설정
    	    currentPage = Math.max(1, currentPage);
    	    // 현재 페이지 번호가 총 페이지 개수를 넘어가면 총 페이지 개수로 설정
    	    currentPage = Math.min(currentPage, totalPages2);
    	    int startIndex2 = (currentPage - 1) * itemsPerPage;
            int endIndex2 = Math.min(startIndex2 + itemsPerPage, totalItems2);
            startIndex2 = Math.max(0, startIndex2);  
            endIndex2 = Math.max(startIndex2, endIndex2);
            
            List<HashMap<String, Object>> qna2 = new ArrayList<>();
            if (startIndex2 < result2.size() && startIndex2 <= endIndex2) {
            	qna2 = result2.subList(startIndex2, endIndex2);
            }
    		m.addAttribute("totalPages2", totalPages2);
            m.addAttribute("qna2", qna2);
            m.addAttribute("currentPage", currentPage);
        	
            m.addAttribute("qnaList", qnaList);
        }
        
        m.addAttribute("qnaAnswerOk", qnaAnswerOk);
        if(!map.get("id").toString().isEmpty()) {
            member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }
        
	} // 1:1 문의 페이지 이동
	
	// 1:1 문의 등록
	@RequestMapping(value = "/qnaRegist", method = RequestMethod.POST)
	public String qnaRegist(QnaDTO qna, MemberInfoDTO member, @RequestParam("editordata") String editordata) throws InterruptedException{

		String textWithoutImages = removeImageTags(editordata);
		qna.setQnaContent(textWithoutImages);
		
		String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\";
		qna.setQnaImgPath(savePath);			

		qna.setMemberId(member);

		mypageService.saveQna(qna);
		
        Thread.sleep(2500); 

		return "redirect:/mypage/qnalist";
	} // 문의 등록 끝
	
	// 이미지태그 삭제하기
	public String removeImageTags(String input) {
	    // 정규식 패턴
	    String pattern = "<img\\s+[^>]*>"; // <img> 태그 패턴

	    // 정규식 패턴에 해당하는 이미지 태그를 빈 문자열로 대체하여 제거
	    String output = input.replaceAll(pattern, "");

	    return output;
	}
	
	// 문의 상세페이지 이동
	@RequestMapping("/qnaDetail")
	public void qnaDetail(Model m, MemberInfoDTO member, @RequestParam("qnaNo") Integer qnaNo){
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        QnaDTO qna = mypageService.qnaFindByRearId(qnaNo);

        
    	m.addAttribute("qnaAnswerOk", qna.getQnaAnswerOk());
    	m.addAttribute("qna", qna);
    	
        if(!map.get("id").toString().isEmpty()) {
            member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }

	}
	
	// 문의 수정
	@RequestMapping("/qnaUpdate")
	public String qnaUpdate(QnaDTO qna, @RequestParam("editordata") String editordata) {
		
		String textWithoutImages = removeImageTags(editordata);
		qna.setQnaContent(textWithoutImages);
		mypageService.qnaUpdate(qna);
		
		return "redirect:/mypage/qnalist";		
	}
	
	// 문의 삭제
	@RequestMapping("/qnaDelete")
	public String qnaDelete(QnaDTO qna) {
		mypageService.qnaDelete(qna);
		
		return "redirect:/mypage/qnalist";		
	}
	
	// 구매내역 입장
	@RequestMapping("/orderlist")
	public void orderlist(@RequestParam(name = "page1", defaultValue = "1") int page1,
			              @RequestParam(name = "page2", defaultValue = "1") int page2,
			              Model m) {
		
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));		
        
        if(!map.get("id").toString().isEmpty()) {
            MemberInfoDTO member = loginService.selectCharacter(map.get("id").toString());
            m.addAttribute("selectCharacter", member.getSelectCharacter());
        }
        
        
        int itemsPerPage = 3;
        int startIndex1 = (page1 - 1) * itemsPerPage;
        
        List<OrderItemsEntity2> orderOList = mypageService.orderOFindByMemberId(String.valueOf(map.get("id")));
        List<OrderItemsEntity2> pagedorderOList = orderOList.subList(startIndex1, Math.min(startIndex1 + itemsPerPage, orderOList.size()));
        m.addAttribute("orderOList", pagedorderOList);
        m.addAttribute("orderOlistSize", orderOList.size());
        
        int itemsPerPage2 = 3;
        int startIndex2 = (page2 - 1) * itemsPerPage2;
        
        List<OrderItemsEntity2> orderXList = mypageService.orderXFindByMemberId(String.valueOf(map.get("id")));
        List<OrderItemsEntity2> pagedorderXList = orderXList.subList(startIndex2, Math.min(startIndex2 + itemsPerPage2, orderXList.size()));
        m.addAttribute("orderXList", pagedorderXList);
        m.addAttribute("orderXlistSize", orderXList.size());
        
        m.addAttribute("currentPage1", page1);
        m.addAttribute("currentPage2", page2);
        m.addAttribute("totalPages1", (orderOList.size() + itemsPerPage - 1) / itemsPerPage);
        m.addAttribute("totalPages2", (orderXList.size() + itemsPerPage2 - 1) / itemsPerPage2);		
	}
	
	 @RequestMapping(value = "/orderlistPage", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	 @ResponseBody
	 public String getOrderList(@RequestParam(name = "tabNumber", defaultValue = "1") int tabNumber,
			 @RequestParam(name = "page1", defaultValue = "1") int page1,
             @RequestParam(name = "page2", defaultValue = "1") int page2,
             Model m) {
		 
			Map<String,Object> map = headerChange();
	        m.addAttribute("id", map.get("id"));
        
	        List<OrderItemsEntity2> orderOList = mypageService.orderOFindByMemberId(String.valueOf(map.get("id")));
	        m.addAttribute("orderOList", orderOList);
        
	        List<OrderItemsEntity2> orderXList = mypageService.orderXFindByMemberId(String.valueOf(map.get("id")));
	        m.addAttribute("orderXList", orderXList);
	        
		 
		    // 해당하는 탭에 대한 HTML 컨텐츠 반환
		    switch (tabNumber) {
		        /*case 2:
		            return generateTab2Content(m, page1, page2);
		        case 3:
		            return generateTab3Content(m, page1, page2);*/
		        case 4:
		            return generateTab4Content(m, page1, page2);
		        case 5:
		            return generateTab5Content(m, page1, page2);
		        default:
		            return "";
		    }
		 
	 }
	 
	 private String generateTab4Content(Model m, int page1, int page2) {
		    // 모델에서 businessList를 가져와 HTML 컨텐츠를 생성하는 코드
		 List<OrderItemsEntity2> orderOList = (List<OrderItemsEntity2>) m.getAttribute("orderOList");
		    
		    int itemsPerPage = 3; // 한 페이지당 보여줄 상품 수
		    int startIndex = (page1 - 1) * itemsPerPage;
		    int endIndex = Math.min(startIndex + itemsPerPage, orderOList.size());
		    List<OrderItemsEntity2> page1Products = orderOList.subList(startIndex, endIndex);
		    
		    StringBuilder content = new StringBuilder();
		    for (OrderItemsEntity2 product : page1Products) {
		        // 각 상품에 대한 HTML 생성
		    	content.append("<div class=\"product-container\">");
		    	content.append("<div class=\"product-info\">");
		        content.append("<div class=\"product-name\">").append(product.getCommerceName()).append("(<span class=\"product-confirm\">배송완료</span>)</div>");
		        content.append("<div class=\"product-invoice\">송장번호: ").append(product.getTrackingNumber()).append("</div>");
		        content.append("<div class=\"product-price\">").append(String.format("%.0f", (double) product.getPrice() / product.getCount())).append("(원) * ").append(product.getCount()).append("(개)</div>");
		        content.append("<br/>");
		        content.append("<div class=\"product-quantity\">총 주문금액 : ").append(product.getPrice()).append("원</div>");
		        content.append("<br/>");
		        content.append("<div class=\"product-orderdate\">결제일: ").append(product.getPayDate()).append("</div>");
		        content.append("<br/>");
		        content.append("<div><a href=\"#\" class=\"costomerCenter\">고객센터 채팅연결</a></div>");
		        content.append("</div>");
		        content.append("<img class=\"product-image\" src=\"/images/commerce/").append(product.getImg()).append("\" alt=\"상품 이미지\">");
		        content.append("</div>");
		    }
		    // 페이징 컨트롤 추가
		    int totalPages1 = (int) Math.ceil((double) orderOList.size() / itemsPerPage);
		    content.append("<ul class=\"pagination\">");
		    for (int i = 1; i <= totalPages1; i++) {
		        content.append("<li class=\"").append(page1 == i ? "active" : "").append("\">");
		        content.append("<a href=\"#\" onclick=\"loadTabContent(4, ").append(i).append(", ").append(page2).append(")\">").append(i).append("</a>");
		        content.append("</li>");
		    }
		    content.append("</ul>");
		    System.out.println("content.toString()");
		    return content.toString();
		}
	 
		 private String generateTab5Content(Model m, int page1, int page2) {
			 
			 int itemsPerPage = 3;
			 List<OrderItemsEntity2> orderXList = (List<OrderItemsEntity2>) m.getAttribute("orderXList");
			 int startIndex = (page2 - 1) * itemsPerPage;
			 int endIndex = Math.min(startIndex + itemsPerPage, orderXList.size());
			 List<OrderItemsEntity2> page2Products = orderXList.subList(startIndex, endIndex);
			 StringBuilder content = new StringBuilder();
			 
			 for (OrderItemsEntity2 product : page2Products) {
				    content.append("<div class=\"product-container\">");
				    content.append("<div class=\"product-info\">");
				    content.append("<div class=\"product-name\">").append(product.getCommerceName()).append("( <span class=\"product-cnacle\"> 결제취소 </span>)</div>");
				    content.append("<div class=\"product-invoice\">송장번호: ").append(product.getTrackingNumber()).append("</div>");
				    content.append("<div class=\"product-price\">").append(String.format("%.0f", (double) product.getPrice() / product.getCount())).append("(원) * ").append(product.getCount()).append("(개)</div>");
				    content.append("<br/>");
				    content.append("<div class=\"product-quantity\">총 환불금액 : ").append(product.getPrice()).append("원</div>");
				    content.append("<br/>");
				    content.append("<div class=\"product-orderdate\">결제일: ").append(product.getPayDate()).append("</div>");
				    content.append("<br/>");
				    content.append("<div><a href=\"#\" class=\"costomerCenter\">고객센터 채팅연결</a></div>");
				    content.append("</div>");
				    content.append("<img class=\"product-image\" src=\"/images/commerce/").append(product.getImg()).append("\" alt=\"상품 이미지\">");
				    content.append("</div>");
			 }
			 
			 int totalPages2 = (int) Math.ceil((double) orderXList.size() / itemsPerPage);
			 content.append("<ul class=\"pagination\">");
			 
		     for (int i = 1; i <= totalPages2; i++) {
		        content.append("<li class=\"").append(page2 == i ? "active" : "").append("\">");
		        content.append("<a href=\"#\" onclick=\"loadTabContent(5, ").append(page1).append(", ").append(i).append(")\">").append(i).append("</a>");
		        content.append("</li>");
		     }
		     content.append("</ul>");			 
			 
			 return content.toString();
		}
	
} // end of class MypageController


	
	

	
	// 맵형식으로 데이터 받기
//	@RequestMapping(value = "/updateMemberInfo", method = RequestMethod.POST)
//	@ResponseBody
//	public String updateMemberInfo(@RequestBody Map<String, Object> map) { 
//		System.out.println(map.entrySet());
//		return "good";
//	}
	
	/*썸머노트 이미지 업로드 구현(방법2)
	@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map<String, String>> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
	    Map<String, String> response = new HashMap<>();

	    String fileRoot = "D:\\summernote_image\\";
	    String originalFileName = multipartFile.getOriginalFilename();
	    String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

	    String savedFileName = UUID.randomUUID() + extension;

	    File targetFile = new File(fileRoot + savedFileName);

	    try {
	        InputStream fileStream = multipartFile.getInputStream();
	        FileUtils.copyInputStreamToFile(fileStream, targetFile);
	        response.put("url", "/summernoteImage/" + savedFileName);
	        response.put("responseCode", "success");
	    } catch (IOException e) {
	        FileUtils.deleteQuietly(targetFile);
	        response.put("responseCode", "error");
	        e.printStackTrace();
	    }

	    return ResponseEntity.ok(response);
	}*/

	/*// 돌보미 신청시 DB 저장(이미지 저장 같이 하기)
	@RequestMapping(value = "/sitterRegist", method = RequestMethod.POST)
	public String sitterRegist(SitterDTO sitter) {
		System.out.println("***************************");
		System.out.println(sitter);
		
	    // 이미지 URL
	    String imageUrl = "http://localhost:8080/summernoteImage/"+sitter.getSitterImg();
	
	    // 이미지를 byte[]로 가져오기 위해 RestTemplate를 사용하여 GET 요청 보내기
	    ResponseEntity<byte[]> responseEntity = restTemplate.getForEntity(imageUrl, byte[].class);
	    
	    // 가져온 이미지 데이터
	    byte[] imageBytes = responseEntity.getBody();
	
	    // 이미지를 저장할 경로와 파일명 설정
	    String savePath = "D:\\summernote_image\\";
	    String fileName = "image.jpg";
	
	    try {
	        // 파일 경로와 파일명을 합친 File 객체 생성
	        FileOutputStream fileOutputStream = new FileOutputStream(savePath + fileName);
	
	        // 이미지 데이터를 파일로 저장
	        fileOutputStream.write(imageBytes);
	
	        // 파일 출력 스트림 닫기
	        fileOutputStream.close();
	
	        // 이미지 저장이 완료되면 마이페이지로 이동
	        return "mypage/sitter";
	    } catch (IOException e) {
	        // 예외 처리 (파일 저장 실패 등)
	        e.printStackTrace();
	        return "error"; // 에러 페이지로 리다이렉트 또는 에러 처리 방법에 따라 적절히 대응
	    }
	}*/


