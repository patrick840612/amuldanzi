package com.amuldanzi.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;
import com.amuldanzi.domain.SitterDTO;
import com.amuldanzi.entity.MemberPetEntity;
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
    RestTemplate restTemplate = new RestTemplate();
	
	
	// 페이지 이동
	@RequestMapping("/{step}")
	public String login(@PathVariable String step, Model m) {
		
		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));

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
	
	// 돌보미 신청시 DB 저장(이미지 저장 안하기 beforeunload로 파일처리 끝냄)
	@RequestMapping(value = "/sitterRegist", method = RequestMethod.POST)
	public String sitterRegist(SitterDTO sitter, @RequestParam("editordata") String editordata) {
	    // 썸머노트 에어리어에 입력한 값에서 <p> 태그 제거
	    Document doc = Jsoup.parse(editordata);
	    String cleanText = doc.text();
	    
		if(!sitter.getSitterImg().equals("")) {
			// 이미지 파일을 저장할 경로 설정 
			String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\";
			sitter.setSitterImgPath(savePath);			
		}
		sitter.setSitterEtc(cleanText);

		System.out.println("***************************");
		System.out.println(sitter);


        return "redirect:/mypage/sitter";
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


