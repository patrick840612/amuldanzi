package com.amuldanzi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amuldanzi.domain.CharacterDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.service.CharacterService;
import com.amuldanzi.service.LoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/character")
public class CharacterController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private CharacterService characterService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/character")
	public void character(Model m, MemberInfoDTO member) {

		Map<String,Object> map = headerChange();
        m.addAttribute("id", map.get("id"));
        m.addAttribute("memberRole", map.get("memberRole"));
        
        Integer cpoint=0;
        List<CharacterDTO> character = characterService.selectByMemberId(map.get("id").toString());
        for(CharacterDTO cha : character) {
        	cpoint = cha.getMemberId().getCpoint();
        }
        member = characterService.findById(map.get("id").toString());
        
        m.addAttribute("cpoint", cpoint);
        m.addAttribute("character", character);
		m.addAttribute("member", member);
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
	
	// 게임 오버시 포인트 업데이트 
	@RequestMapping("/cpointupdate")
	@ResponseBody
	public String cpointupdate(MemberInfoDTO member) {
		characterService.cpointupdate(member);
		
		return String.valueOf(member.getCpoint()); 
	}
	
	// 캐릭터 뽑기
	@RequestMapping("/random")
	public String random(@RequestParam("randomAnimal") String randomAnimal, MemberInfoDTO member) {
		
		CharacterDTO character = new CharacterDTO();
		character.setCharacterImg(randomAnimal);
		character.setMemberId(member);
		member.setCpoint(member.getCpoint()-10000);
		characterService.random(member, character);
		
		return "redirect:/character/character";
	}
	
	//캐릭터 선택
	@RequestMapping("/selectCharacter")
	@ResponseBody
	public String selectCharacter(MemberInfoDTO member) {
		characterService.selectCharacter(member);
		
		return member.getSelectCharacter(); 
	}	
	
	//캐릭터 선택
	@RequestMapping("/evolveCharacter")
	@ResponseBody
	public String evolveCharacter(MemberInfoDTO member, CharacterDTO character) {
		characterService.evolveCharacter(member, character);
		member.setCpoint(member.getCpoint()-10000);
		
		return String.valueOf(member.getCpoint()); 
	}	

	
}
