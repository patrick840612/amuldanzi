package com.amuldanzi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.MemberPetDTO;
import com.amuldanzi.domain.MemberSocialDTO;
import com.amuldanzi.domain.MemberUpdateDTO;
import com.amuldanzi.entity.MemberPetEntity;
import com.amuldanzi.service.LoginService;
import com.amuldanzi.service.MypageService;

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

	
	
	
	
	
	// 맵형식으로 데이터 받기
//	@RequestMapping(value = "/updateMemberInfo", method = RequestMethod.POST)
//	@ResponseBody
//	public String updateMemberInfo(@RequestBody Map<String, Object> map) { 
//		System.out.println(map.entrySet());
//		return "good";
//	}
}
