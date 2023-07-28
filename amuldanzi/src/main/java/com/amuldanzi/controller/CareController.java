package com.amuldanzi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amuldanzi.domain.CareDTO;
import com.amuldanzi.service.CareService;

@Controller
@RequestMapping("/care")
public class CareController {
// 정보게시판 - 케어정보
	
	@Autowired
	CareService service;
	
	// 케어정보 목록 요청
	@RequestMapping("/care")
	public void care(Model m) {
		// 케어정보 목록을 서비스에서 가져옴
		List<CareDTO> careList = service.getCareList();
		// 뷰에 케어정보 목록을 전달하기 위해 model에 추가
		m.addAttribute("careList", careList);
		System.out.println(careList);
	}
	
	//특정 케어정보의 세부내용 요청
	@RequestMapping("/careDetail")
	public void careDetail(@RequestParam(value = "id", required = false) Integer careId, Model m) {
		if (careId != null) {
			//해당 ID에 해당하는 케어정보를 서비스에서 가져옴
			CareDTO care = service.getCareByCareId(careId);
			// 뷰에 해당 케어정보 전달하기 위해 Model에 추가
			m.addAttribute("care", care);
			
			// 모든 케어정보 목록을 서비스에서 가져옴
			List<CareDTO> careList = service.getCareList();
			List<Map<String, String>> items = new ArrayList<>();
	
			// 모든 케어정보를 순회하면서 필요한 정보를 map에 담아 items 리스트에 추가
			for (CareDTO item : careList) {
				Map<String, String> map = new HashMap<>();
				map.put("image", item.getImg());
				map.put("title", item.getTitle());
				map.put("id", String.valueOf(item.getId()));
				items.add(map);
			}
			m.addAttribute("items", items);
		} else {
			 return;
		}
	}
	
	
}
